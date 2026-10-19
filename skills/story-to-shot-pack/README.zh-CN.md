# Story to Shot Pack｜AI 漫剧剧本转分镜 Skill

适用于将**已经写完的短剧、漫剧或动态漫画剧本**转换为可制作的镜头清单。仅含虚构示例，不包含公司内部素材、账号或客户资料。

- **v0.1.0**：剧本→镜头清单、动作、对白与画面/视频提示词。
- **v0.2.0**：增加人物/线索连续性、帧级时间轴、字幕与音频字段、离线检验脚本。

两版均为 2026-10-19 制作的首次公开版本；不冒充历史公司软件版本。

安装：将 `skills/story-to-shot-pack/` 整个文件夹复制到支持 Agent Skills 的工具技能目录。运行 `python scripts/validate_shotlist.py examples/shotlist.example.json` 验证格式。

边界：该 Skill 只制作拍摄规划和验证数据，不代表已经出片、已经获得素材版权或已经发布视频。
