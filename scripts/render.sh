#!/usr/bin/env bash
# Remotion 渲染脚本
# 前置：remotion.config.ts 必须写死 setBrowserExecutable 指向本地 Chrome Headless Shell
# （Remotion 自动下载常超时。浏览器内核路径按下方优先级自动探测）
#
# 用法：bash render.sh <项目目录> <compositionID> <输出文件名>
# 例：bash render.sh ~/workspace/video/muse-ep1-remotion MuseEP1 out/muse-ep1-v2.mp4
#
# 跨平台说明（antigravity 验收建议）：
#   浏览器内核按以下优先级定位——
#   1. 环境变量 CHROME_BIN（最高优先级，跨机器一键切换）
#   2. 常见安装位置自动探测（Linux / macOS / Windows Git Bash）
#   3. EP1 验证过的手动路径（最后兜底）
set -euo pipefail

PROJECT_DIR="${1:?请传 Remotion 项目目录}"
COMP_ID="${2:?请传 composition ID（必须与 src/index.ts 注册的一致）}"
OUT_FILE="${3:?请传输出文件名}"

detect_browser() {
  # 1. 环境变量优先
  if [ -n "${CHROME_BIN:-}" ] && [ -x "$CHROME_BIN" ]; then
    echo "$CHROME_BIN"; return 0
  fi
  # 2. 常见位置探测
  for c in \
    "/usr/bin/google-chrome" \
    "/usr/bin/chromium" \
    "/usr/bin/chromium-browser" \
    "$HOME/workspace/video/chrome-shell/chrome-headless-shell-linux64/chrome-headless-shell" \
    "/home/hatch/workspace/video/chrome-shell/chrome-headless-shell-linux64/chrome-headless-shell" \
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
    "/c/Program Files/Google/Chrome/Application/chrome.exe" \
    "/c/Program Files (x86)/Google/Chrome/Application/chrome.exe" \
    "C:/Program Files/Google/Chrome/Application/chrome.exe" \
    "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"; do
    if [ -x "$c" ]; then echo "$c"; return 0; fi
  done
  # 3. PATH 里找
  command -v google-chrome 2>/dev/null \
    || command -v chromium 2>/dev/null \
    || command -v chrome 2>/dev/null \
    || true
}

BROWSER_EXE="$(detect_browser)"

cd "$PROJECT_DIR"

# 校验 config 里配了浏览器内核，没有就提醒
if ! grep -q "setBrowserExecutable" remotion.config.ts 2>/dev/null; then
  echo "⚠️ remotion.config.ts 未配置 setBrowserExecutable，自动下载可能超时。"
  if [ -n "$BROWSER_EXE" ]; then
    echo "  探测到的可用内核：$BROWSER_EXE"
    echo "  建议写入：Config.setBrowserExecutable(\"$BROWSER_EXE\")"
  else
    echo "  未探测到本地浏览器内核，可设 CHROME_BIN 环境变量指定。"
  fi
fi

npx remotion render src/index.ts "$COMP_ID" "$OUT_FILE" --codec h264 --overwrite
echo "✅ 渲染完成：$OUT_FILE"

# 响度偏小时整体增益（EP1 实测渲染后约 -23 LUFS，加了 6dB）
# 按需执行：ffmpeg -i "$OUT_FILE" -c:v copy -c:a aac -b:a 192k -af "volume=6dB" "${OUT_FILE%.mp4}-loud.mp4"
