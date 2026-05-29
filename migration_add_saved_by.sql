-- Migration: Add saved_by column to ideas table
-- Run this in your Supabase SQL editor

ALTER TABLE ideas ADD COLUMN IF NOT EXISTS saved_by TEXT;

-- Add index for better query performance
CREATE INDEX IF NOT EXISTS idx_ideas_saved_by ON ideas(saved_by);
