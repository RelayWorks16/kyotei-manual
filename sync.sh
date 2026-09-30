#!/bin/bash
# kyotei-martingale/manual.html（元ファイル）を2か所に反映する
#   1) GitHub Pages … このリポジトリの index.html → push した時点で公開
#   2) 社内ポータル … ksj-website/staff/kyotei/manual.html → 次に staff のzipを入れ替えたときに反映
# ※ どちらも直接編集しない（次の反映で上書きされる）
set -e
cd "$(dirname "$0")"
SRC=/Users/kazuya/AI/kyotei-martingale/manual.html
PORTAL=/Users/kazuya/AI/ksj-website/staff/kyotei/manual.html

cp "$SRC" "$PORTAL"
echo "ポータル用にコピー: $PORTAL（staffのzip入れ替えで反映）"

cp "$SRC" index.html
git add index.html
if git diff --cached --quiet; then
  echo "GitHub Pages: 変更なし"
else
  git commit -m "docs: マニュアル更新 $(date '+%Y-%m-%d %H:%M')"
  git push origin main
  echo "GitHub Pages 公開: https://relayworks16.github.io/kyotei-manual/"
fi
