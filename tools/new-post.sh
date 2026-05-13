#!/bin/bash
# 创建新文章
cd "$(dirname "$0")/.."
echo -n "输入文章标题: "
read -r TITLE
if [ -z "$TITLE" ]; then
  echo "标题不能为空！"
  exit 1
fi
npx hexo new "$TITLE"
echo "✅ 文章已创建，在 source/_posts/ 下找喵~"
