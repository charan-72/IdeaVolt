# IdeaVolt

Capture ideas before they disappear. A lightweight, single-page idea vault built with vanilla HTML/CSS/JS and Supabase.

## Pages

- **Home** — Apple-inspired landing page with hero, features grid, and how-it-works steps
- **Ideas** — Capture and browse ideas with title, description, tags, and contributor name
- **Products** — Overview of active and in-progress projects
- **About** — Why IdeaVolt exists

## Features

- **Instant Capture** — Title + description + tag + name, saved in one click
- **Smart Autocomplete** — Previously used names appear as suggestions (stored in localStorage)
- **Tag Organization** — Filter ideas by type: General, Feature, Design, Fix, Growth
- **Contributor Tracking** — Every idea shows who saved it and when
- **Validation** — Title and name are required with visual error states
- **Keyboard Shortcut** — `Ctrl+Enter` to save quickly
- **Responsive** — Works on desktop, tablet, and mobile

## Tech Stack

- **Frontend** — Single `index.html` file (HTML + CSS + JS, no build tools)
- **Backend** — [Supabase](https://supabase.com) (PostgreSQL + REST API)
- **Hosting** — [Netlify](https://netlify.com) with build-time env injection
- **Font** — [Manrope](https://fonts.google.com/specimen/Manrope) (Google Fonts)

## Setup

1. Create a [Supabase](https://supabase.com) project
2. Run the table SQL in the Supabase SQL editor:
   ```sql
   CREATE TABLE ideas (
     id BIGSERIAL PRIMARY KEY,
     title TEXT NOT NULL,
     body TEXT,
     tag TEXT DEFAULT 'general',
     saved_by TEXT,
     created_at TIMESTAMPTZ DEFAULT NOW()
   );
   ```
   Or if upgrading, run `migration_add_saved_by.sql` to add the `saved_by` column.
3. Connect this repo to Netlify
4. Add environment variables in Netlify:
   - `SUPABASE_URL` — your Supabase project URL
   - `SUPABASE_KEY` — your Supabase anon/public key
5. Deploy — Netlify runs `build.sh` which injects the env vars

## Local Development

No npm required. Serve the file with any static server:

```bash
# Python
python -m http.server 8080

# Or use VS Code Live Server extension
```

## Project Structure

```
index.html                  — Entire app (HTML + CSS + JS)
build.sh                    — Replaces __SUPABASE_URL__ and __SUPABASE_KEY__ at build time
netlify.toml                — Netlify build config (runs build.sh, serves dist/)
migration_add_saved_by.sql  — SQL migration for saved_by column
```

## How It Works

1. `index.html` contains `__SUPABASE_URL__` and `__SUPABASE_KEY__` placeholders
2. `build.sh` replaces them with real values from Netlify environment variables
3. `netlify.toml` tells Netlify to run the build script and publish from `dist/`
4. Credentials never appear in the repo

