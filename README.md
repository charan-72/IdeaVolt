# IdeaVolt

A simple idea capture tool. Open it, type it, save it.

## Setup

1. Create a Supabase project and run the SQL in the dashboard
2. Connect this repo to Netlify
3. Add environment variables in Netlify:
   - `SUPABASE_URL` — your Supabase project URL
   - `SUPABASE_KEY` — your Supabase anon public key
4. Deploy — Netlify runs `build.sh` which injects the env variables

## How it works

- `index.html` has `__SUPABASE_URL__` and `__SUPABASE_KEY__` placeholders
- `build.sh` replaces them with real values from Netlify env variables
- `netlify.toml` tells Netlify to run the build script and serve from `dist/`
- Credentials never appear in the repo
