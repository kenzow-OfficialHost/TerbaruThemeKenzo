#!/bin/bash

set -e

echo "=================================="
echo "  KENZO THEME INSTALLER"
echo "=================================="

# Install dependencies jika belum ada
command -v git >/dev/null 2>&1 || pkg install git -y || apt install git -y
command -v node >/dev/null 2>&1 || { echo "Node.js belum terinstall"; exit 1; }
command -v npm >/dev/null 2>&1 || { echo "npm belum terinstall"; exit 1; }

REPO_URL="https://github.com/kenzow-OfficialHost/TerbaruThemeKenzo.git"

if [ -d "TerbaruThemeKenzo" ]; then
    echo "Repo sudah ada, update..."
    cd TerbaruThemeKenzo
    git pull
else
    echo "Clone repo..."
    git clone $REPO_URL
    cd TerbaruThemeKenzo
fi

echo "Install dependencies..."
npm install

echo "Build theme..."
npm run build

echo "Selesai ✅"
