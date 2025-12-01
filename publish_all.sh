#!/bin/bash
set -e

echo "======================================="
echo " S2D01 - BUILD + PUBLISH IT + EN"
echo "======================================="

cd "$(dirname "$0")"

# 1. Build IT + EN
./build_all.sh

# 2. Deploy su GitHub Pages (branch gh-pages)
echo ""
echo "📤 Pubblico su GitHub Pages (gh-pages)..."
source .venv/bin/activate
python3 -m mkdocs gh-deploy --clean

echo ""
echo "🚀 FATTO! Sito aggiornato su GitHub Pages."
