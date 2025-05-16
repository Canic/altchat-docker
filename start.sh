#!/bin/bash

REPO_URL="https://github.com/altcha-org/altcha-starter-go.git"
TMP_DIR="/tmp/altcha"

# Wenn tmp Ordner existiert, updaten, sonst klonen
if [ -d "$TMP_DIR/.git" ]; then
  echo "Update Repo im temporären Ordner..."
  cd "$TMP_DIR" && git pull origin main
else
  echo "Klonen Repo in temporären Ordner..."
  rm -rf "$TMP_DIR"
  git clone --depth 1 "$REPO_URL" "$TMP_DIR"
fi

# Alles von tmp nach /app kopieren (überschreibt alles)
echo "Kopiere Quellcode nach /app..."
rm -rf /app/*
cp -r $TMP_DIR/* /app/

# Wechsel in /app und starte Server
cd /app
go mod tidy
echo "Starte Server mit 'go run main.go' ..."
go run main.go
