#!/bin/zsh
# publish.sh: refresh the site's pages from their sources and push. Run after `python3 -I parity_page.py` in
# ~/Documents/photocraft-pr-drafts/round-2026-11-21 (or after a new compare-viewer progress.html).
set -e
B=~/Documents/photocraft-parity-site
cp ~/Documents/photocraft-pr-drafts/round-2026-11-21/parity-state-transforms.html $B/index.html
cp ~/Documents/photocraft-warp-oracles/compare-viewer/progress.html $B/progress.html
sed -i 's|href="index.html"|href="https://github.com/DingusMcRinkyDinky/photocraft"|' $B/progress.html
if grep -qil "photoshop\|adobe" $B/index.html $B/progress.html $B/README.md; then echo "refusing: the reference's name is in a page"; exit 1; fi
cd $B && git add -A && git -c user.name=DingusMcRinkyDinky -c user.email=127614779+DingusMcRinkyDinky@users.noreply.github.com commit -q -m "Update: $(date +%Y-%m-%d\ %H:%M)" && git push -q origin main && echo "published https://dingusmcrinkydinky.github.io/photocraft-parity/"
