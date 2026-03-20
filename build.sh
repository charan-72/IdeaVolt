#!/bin/bash
# Build script: replaces placeholders with Netlify environment variables
mkdir -p dist
sed "s|__SUPABASE_URL__|${SUPABASE_URL}|g; s|__SUPABASE_KEY__|${SUPABASE_KEY}|g" index.html > dist/index.html
echo "Build complete — env variables injected"
