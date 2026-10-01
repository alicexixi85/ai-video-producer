#!/usr/bin/env bash
# Remotion 渲染脚本
# 前置：remotion.config.ts 必须写死 setBrowserExecutable 指向本地 Chrome Headless Shell
# （Remotion 自动下载常超时。EP1 验证可用的内核路径见下方 BROWSER_EXE）
#
# 用法：bash render.sh <项目目录> <compositionID> <输出文件名>
# 例：bash render.sh ~/workspace/video/muse-ep1-remotion MuseEP1 out/muse-ep1-v2.mp4
set -euo pipefail

PROJECT_DIR="${1:?请传 Remotion 项目目录}"
COMP_ID="${2:?请传 composition ID（必须与 src/index.ts 注册的一致）}"
OUT_FILE="${3:?请传输出文件名}"

# EP1 验证可用的手动内核（自动下载超时时用这个）
BROWSER_EXE="/home/hatch/workspace/video/chrome-shell/chrome-headless-shell-linux64/chrome-headless-shell"

cd "$PROJECT_DIR"

# 校验 config 里配了浏览器内核，没有就提醒
if ! grep -q "setBrowserExecutable" remotion.config.ts 2>/dev/null; then
  echo "⚠️ remotion.config.ts 未配置 setBrowserExecutable，自动下载可能超时。"
  echo "  建议写入：Config.setBrowserExecutable(\"$BROWSER_EXE\")"
fi

npx remotion render src/index.ts "$COMP_ID" "$OUT_FILE" --codec h264 --overwrite
echo "✅ 渲染完成：$OUT_FILE"

# 响度偏小时整体增益（EP1 实测渲染后约 -23 LUFS，加了 6dB）
# 按需执行：ffmpeg -i "$OUT_FILE" -c:v copy -c:a aac -b:a 192k -af "volume=6dB" "${OUT_FILE%.mp4}-loud.mp4"
