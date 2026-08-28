#!/bin/bash
# kyotei-martingale/manual.html を index.html に反映して GitHub Pages を更新する
set -e
cd "$(dirname "$0")"
cp /Users/kazuya/AI/kyotei-martingale/manual.html index.html
git add index.html
if git diff --cached --quiet; then
  echo "変更なし"
else
  git commit -m "docs: マニュアル更新 $(date '+%Y-%m-%d %H:%M')"
  git push origin main
  echo "公開: https://relayworks16.github.io/kyotei-manual/"
fi
