#!/usr/bin/env bash
# 音频验片：分段音量 + 整体响度
# 用途：验证 BGM ducking 曲线是否写反——旁白窗口内 BGM 必须被压住、人声清晰。
# 注意：loudnorm 双遍扫描在本机可能卡住，这里只用单遍 ebur128，不卡。
#
# 用法：bash check-audio.sh <成片mp4>
# 例：bash check-audio.sh out/muse-ep1-v2-loud.mp4
set -euo pipefail

FILE="${1:?请传成片 mp4 路径}"
DUR=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$FILE" | cut -d. -f1)

echo "=== 整体响度（ebur128 单遍）==="
ffmpeg -hide_banner -i "$FILE" -af ebur128=peak=true -f null - 2>&1 | \
  grep -E "I:|Peak:" | tail -4
echo "目标：Integrated loudness 约 -16 LUFS，True Peak 不超 -1 dBFS"

echo ""
echo "=== 分段 RMS（每 4 秒一段，s=旁白窗口应明显高于纯BGM段）==="
s=0
while [ "$s" -lt "$DUR" ]; do
  rms=$(ffmpeg -hide_banner -ss "$s" -t 4 -i "$FILE" -af astats -f null - 2>&1 | \
    grep "RMS level dB" | head -1 | awk '{print $4}')
  printf "[%02ds-%02ds] RMS %s dB\n" "$s" $((s+4)) "$rms"
  s=$((s+4))
done

echo ""
echo "=== 人工核对 ==="
echo "1. 对照旁白时间轴，窗口内 RMS 应明显高于纯 BGM 段"
echo "2. 若 BGM 在旁白窗口内反而更大 → ducking 写反了，回查 k 值定义"
