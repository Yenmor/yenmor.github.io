#!/bin/bash
# 提交并推送博客
echo -n "输入提交信息（留空则默认'更新博客'）: "
read -r MSG
MSG="${MSG:-更新博客}"
git add . && git commit -m "$MSG" && git push origin main
echo "✅ 推送完成，Actions 自动部署中喵~"
