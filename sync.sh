#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> 1. 同步 VS Code / Antigravity / Cursor (Markdown Preview Enhanced) 自定义样式..."
for dir in "$HOME/.crossnote" "$HOME/.local/state/crossnote"; do
  mkdir -p "$dir"
  cp "$REPO_DIR/vscode-mpe/style.less" "$dir/style.less"
  echo "    已写入: $dir/style.less"
done

echo "==> 2. 同步 Typora 主题与自定义覆盖样式..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  TYPORA_THEME_DIR="$HOME/Library/Application Support/abnerworks.Typora/themes"
else
  TYPORA_THEME_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/Typora/themes"
fi

mkdir -p "$TYPORA_THEME_DIR"
if [[ ! -f "$TYPORA_THEME_DIR/newsprint.css" ]]; then
  cp "$REPO_DIR/typora/newsprint.css" "$TYPORA_THEME_DIR/newsprint.css"
  cp -R "$REPO_DIR/typora/newsprint" "$TYPORA_THEME_DIR/"
  echo "    已补全基础主题: $TYPORA_THEME_DIR/newsprint.css"
fi

cp "$REPO_DIR/typora/newsprint.user.css" "$TYPORA_THEME_DIR/newsprint.user.css"
echo "    已写入: $TYPORA_THEME_DIR/newsprint.user.css"

if [[ "$OSTYPE" == "darwin"* ]]; then
  defaults write abnerworks.Typora theme "Newsprint" 2>/dev/null || true
  defaults delete abnerworks.Typora backgroundColor 2>/dev/null || true
  defaults delete abnerworks.Typora backgroundColor2 2>/dev/null || true
  echo "    已将 Typora 默认主题切换为: Newsprint（并清除旧主题背景色缓存）"
fi

echo "==> 同步完成！"
