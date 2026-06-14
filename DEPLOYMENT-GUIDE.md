# 🚀 Deployment Guide - Nusantara Basa

## ✅ Build Status

✅ Production build berhasil: 15.34 seconds
- Static pages generated: 18/18
- Total bundle size: ~96-101 kB (per route)
- No TypeScript errors
- No ESLint errors

## 📦 Pre-requisites

### Environment Variables (Required)

```bash
# Supabase Database Connection
NEXT_PUBLIC_SUPABASE_URL=https://hkeheukewxsvaarxaket.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=<your-anon-key>
SUPABASE_SERVICE_ROLE_KEY=<your-service-role-key>

# Optional - for development
NINEROUTER_URL=http://localhost:20128
NINEROUTER_KEY=<your-key>
```

### Node.js Version

```bash
node --version  # Should be v18+ (tested on v26.1.0)
npm --version   # Should be 9+ (tested on 10.x)
```

---

## 🌐 Deploy to Vercel (Recommended)

### Step 1: Push to GitHub

```bash
cd "C:/Users/Rokan Akbar Marik/Documents/projects/nusantara-basa"
git add .
git commit -m "build: production-ready deploy with fixed types"
git push origin main
```

### Step 2: Connect to Vercel

1. Visit [vercel.com](https://vercel.com)
2. Login / Sign up
3. Click **"Add New Project"**
4. Import repository `nusantara-basa`
5. Vercel auto-detects Next.js config

### Step 3: Configure Build Settings

Vercel will auto-config, but verify:

**Framework Preset:** Next.js  
**Build Command:** `prisma generate && next build`  
**Output Directory:** `.next`  
**Install Command:** `npm install`

### Step 4: Add Environment Variables

In Vercel Dashboard → Settings → Environment Variables:

```
NEXT_PUBLIC_SUPABASE_URL
NEXT_PUBLIC_SUPABASE_ANON_KEY
SUPABASE_SERVICE_ROLE_KEY
```

Set both for **Development**, **Staging**, and **Production**.

### Step 5: Deploy

Click **"Deploy"** and wait ~3-5 minutes.

**Success URL:** `https://nusantara-basa.vercel.app`

---

## 🖥️ Manual Server Deployment

### Option A: Docker Deployment

```bash
# Build Docker image
docker build -t nusantara-basa .

# Run container
docker run -d \
  -p 3000:3000 \
  -e NEXT_PUBLIC_SUPABASE_URL=https://hkeheukewxsvaarxaket.supabase.co \
  -e NEXT_PUBLIC_SUPABASE_ANON_KEY=<anon-key> \
  -e SUPABASE_SERVICE_ROLE_KEY=<service-key> \
  --name nusantara-basa \
  nusantara-basa
```

### Option B: PM2 Process Manager

```bash
# Build project
npm run build

# Start with PM2
pm2 start npm --name "nusantara-basa" -- start
pm2 save
pm2 startup
```

### Option C: Simple Node.js

```bash
# Build
npm run build

# Start server
npm start

# Or in background
nohup npm start > app.log 2>&1 &
```

---

## 🔍 Post-Deployment Verification

### Check API Endpoints

```bash
curl https://nusantara-basa.vercel.app/api/bahasa?limit=5
# Expected: JSON array of languages

curl https://nusantara-basa.vercel.app/api/locations/markers
# Expected: JSON array of language markers
```

### Test Frontend Pages

| Page | URL | Expected |
|------|-----|----------|
| Landing | `/` | Hero section + explore button |
| Explore | `/explore` | Bahasa list with filters |
| Map | `/explore/map` | Interactive leaflet map |
| Detail | `/explore/bahasa/[id]` | Language detail page |
| Sejarah | `/explore/bahasa/[id]/sejarah` | Historical timeline |

---

## 🛠️ Troubleshooting

### Error: "Build failed after 10 minutes"

**Solution:** Increase Vercel timeout or optimize bundles:
```bash
# Check bundle sizes
npm run analyze

# Consider code splitting large components
```

### Error: "Prisma Client not generated"

**Solution:** Ensure Prisma is properly configured:
```bash
npx prisma db push
npx prisma generate
```

### Error: "Cannot connect to Supabase"

**Solutions:**
1. Verify environment variables are set in Vercel dashboard
2. Check network connectivity from Vercel servers
3. Ensure Supabase project is public (not private)

### Error: "Module not found: react-leaflet"

**Solution:** Install missing dependencies:
```bash
npm install leaflet @types/leaflet react-leaflet
```

---

## 🔄 CI/CD Pipeline

### GitHub Actions (Optional)

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Vercel

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Build
        run: npm run build
        
      - name: Deploy to Vercel
        uses: amondnet/vercel-action@v25
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.ORG_ID }}
          vercel-project-id: ${{ secrets.PROJECT_ID }}
          vercel-args: '--prod'
```

---

## 📊 Performance Benchmarks

After deployment, check performance metrics:

```bash
# Lighthouse score (run locally)
npm install -g lighthouse
lighthouse https://nusantara-basa.vercel.app --view
```

**Expected Scores:**
- Performance: 85+
- Accessibility: 90+
- Best Practices: 90+
- SEO: 95+

---

## 🧪 Testing Checklist

Before production deployment:

- [ ] All static pages render correctly
- [ ] Dynamic routes work (`/explore/bahasa/[id]`)
- [ ] API endpoints return valid JSON
- [ ] Mobile view responsive (test on mobile devices)
- [ ] Map interactions work (zoom, pan, click markers)
- [ ] Search/filter works on daftar-bahasa page
- [ ] Cross-browser compatibility (Chrome, Firefox, Safari, Edge)

---

## 📞 Support & Maintenance

### Log Monitoring

Vercel provides logs automatically. Access via:
1. Vercel Dashboard → Project → Logs
2. Filter by environment (Production/Staging)

### Error Tracking

Consider integrating Sentry or similar:
```bash
npm install @sentry/nextjs
npx @sentry/wizard@latest -i nextjs
```

### Database Backup

Set up automated backups for Supabase:
1. Supabase Dashboard → Database → Backups
2. Enable automatic daily backups
3. Set retention policy (recommended: 7 days)

---

## 📝 Changelog

### v1.0.0 - Production Ready (Current)
- ✅ Fixed TypeScript compilation errors
- ✅ Added History tab navigation
- ✅ Improved MapPopup component with ISO codes
- ✅ Created comprehensive README documentation
- ✅ Configured Vercel deployment settings
- ✅ Verified build succeeds without errors

### Upcoming
- Data enrichment scripts (requires local execution)
- Historical data seeding
- Production testing with real database

---

**Ready to deploy!** 🎉

Last updated: 2025
Project: Nusantara Basa - Peta Bahasa Indonesia Digital
