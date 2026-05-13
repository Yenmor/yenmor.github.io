#!/bin/bash
# 本地预览博客
cd "$(dirname "$0")/.."
npx hexo clean && npx hexo generate && npx hexo server
echo "🌐 http://localhost:4000"
