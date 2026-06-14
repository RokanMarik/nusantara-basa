-- Create validation_logs table for storing automated validation results
-- This table stores the results of scheduled validation runs

CREATE TABLE IF NOT EXISTS validation_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  timestamp TIMESTAMPTZ NOT NULL,
  score INTEGER NOT NULL CHECK (score >= 0 AND score <= 100),
  total_checks INTEGER NOT NULL CHECK (total_checks > 0),
  pass_count INTEGER NOT NULL CHECK (pass_count >= 0),
  warning_count INTEGER NOT NULL CHECK (warning_count >= 0),
  fail_count INTEGER NOT NULL CHECK (fail_count >= 0),
  details JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for efficient querying of recent validation runs
CREATE INDEX IF NOT EXISTS idx_validation_logs_timestamp ON validation_logs(timestamp DESC);

-- Index for filtering by score ranges
CREATE INDEX IF NOT EXISTS idx_validation_logs_score ON validation_logs(score);

-- Add comment for documentation
COMMENT ON TABLE validation_logs IS 'Stores results from automated data quality validation checks';
COMMENT ON COLUMN validation_logs.timestamp IS 'When the validation was run';
COMMENT ON COLUMN validation_logs.score IS 'Overall data quality score (0-100)';
COMMENT ON COLUMN validation_logs.total_checks IS 'Total number of validation checks performed';
COMMENT ON COLUMN validation_logs.pass_count IS 'Number of checks that passed';
COMMENT ON COLUMN validation_logs.warning_count IS 'Number of checks with warnings';
COMMENT ON COLUMN validation_logs.fail_count IS 'Number of checks that failed';
COMMENT ON COLUMN validation_logs.details IS 'Detailed results for each validation check (JSON)';

-- Example query to get recent validation history
-- SELECT timestamp, score, pass_count, warning_count, fail_count 
-- FROM validation_logs 
-- ORDER BY timestamp DESC 
-- LIMIT 30;
