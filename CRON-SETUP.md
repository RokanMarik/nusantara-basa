# Setup Automated Validation Cron Job

## Overview
The validation system includes a cron endpoint that can be scheduled to run automatically. This ensures data quality is monitored regularly.

## Endpoint
```
POST /api/cron/validate
```

## Authentication
The endpoint requires a `CRON_SECRET` environment variable for authentication.

```bash
Authorization: Bearer YOUR_CRON_SECRET
```

## Setting Up Cron Schedule

### Option 1: Vercel Cron Jobs (Recommended)

1. Go to your Vercel project dashboard
2. Navigate to **Settings** → **Cron Jobs**
3. Click **Add Cron Job**
4. Configure:
   - **Target**: `/api/cron/validate`
   - **Method**: POST
   - **Headers**: 
     - `Authorization: Bearer YOUR_CRON_SECRET`
   - **Schedule**: `0 0 * * 1` (Every Monday at midnight)
   - **Description**: Weekly data validation

### Option 2: GitHub Actions

Create `.github/workflows/validate.yml`:

```yaml
name: Weekly Data Validation

on:
  schedule:
    - cron: '0 0 * * 1'  # Every Monday at midnight
  workflow_dispatch:  # Allow manual trigger

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - name: Run Validation
        run: |
          curl -X POST \
            -H "Authorization: Bearer ${{ secrets.CRON_SECRET }}" \
            https://your-app.vercel.app/api/cron/validate
```

### Option 3: External Cron Service (cron-job.org)

1. Sign up at https://cron-job.org
2. Create new cron job:
   - **URL**: `https://your-app.vercel.app/api/cron/validate`
   - **Method**: POST
   - **Headers**: 
     - `Authorization: Bearer YOUR_CRON_SECRET`
   - **Schedule**: Weekly (Monday, 00:00)

### Option 4: Local Development (node-cron)

For local testing, add to your development server:

```javascript
// In a separate file: cron.js
const cron = require('node-cron');
const fetch = require('node-fetch');

cron.schedule('0 0 * * 1', async () => {
  console.log('Running weekly validation...');
  try {
    const response = await fetch('http://localhost:3000/api/cron/validate', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${process.env.CRON_SECRET}`,
      }
    });
    const result = await response.json();
    console.log('Validation complete:', result);
  } catch (error) {
    console.error('Validation failed:', error);
  }
});
```

## Environment Variables

Add to your `.env.local` (development) and Vercel environment variables (production):

```bash
CRON_SECRET=your-secret-token-here
```

Generate a secure secret:
```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

## Database Setup

Create the `validation_logs` table to store validation history:

```sql
CREATE TABLE validation_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  timestamp TIMESTAMPTZ NOT NULL,
  score INTEGER NOT NULL,
  total_checks INTEGER NOT NULL,
  pass_count INTEGER NOT NULL,
  warning_count INTEGER NOT NULL,
  fail_count INTEGER NOT NULL,
  details JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_validation_logs_timestamp ON validation_logs(timestamp DESC);
```

## Monitoring

### View Validation History
Access the validation dashboard at `/validate` to see:
- Current validation score
- History of validation runs
- Trend analysis
- Critical issues

### API Endpoint for History
```
GET /api/cron/validate
```

Returns the last 30 validation runs with full details.

## Alerting (Optional Enhancement)

To add email/Slack notifications for critical issues:

### Email (Resend/SendGrid)
```javascript
if (hasCritical) {
  await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${process.env.RESEND_API_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      from: 'validation@your-app.com',
      to: 'admin@your-app.com',
      subject: '⚠️ Critical Data Validation Issues',
      html: `<p>Score: ${validationResult.score}</p>
             <p>Failed checks: ${validationResult.fail_count}</p>
             <a href="https://your-app.vercel.app/validate">View Details</a>`
    })
  });
}
```

### Slack Webhook
```javascript
if (hasCritical) {
  await fetch(process.env.SLACK_WEBHOOK_URL, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      text: '⚠️ Critical Data Validation Issues',
      blocks: [
        {
          type: 'section',
          text: {
            type: 'mrkdwn',
            text: `*Score:* ${validationResult.score}\n*Failed:* ${validationResult.fail_count}\n<https://your-app.vercel.app/validate|View Details>`
          }
        }
      ]
    })
  });
}
```

## Recommended Schedule

- **Daily**: For high-traffic sites with frequent data updates
- **Weekly**: For most use cases (recommended)
- **Monthly**: For stable datasets with infrequent changes

## Manual Trigger

You can manually trigger validation:

```bash
curl -X POST \
  -H "Authorization: Bearer YOUR_CRON_SECRET" \
  https://your-app.vercel.app/api/cron/validate
```

Or visit `/validate` in your browser to run validation on-demand.
