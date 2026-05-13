# yenmor超绝技术分享站

> 超级弱鸡分享站 — えんもあ feat. yenmor feat. 暴龍天

基于 [Hexo](https://hexo.io/) + [Butterfly](https://butterfly.js.org/) 搭建，GitHub Actions 自动部署到 [yenmor.github.io](https://yenmor.github.io)。

## 技术栈

| 类型 | 方案 |
|------|------|
| 框架 | Hexo 7 |
| 主题 | Butterfly 5.5.4 |
| 部署 | GitHub Actions → gh-pages |
| 图床 | PicGo + 腾讯云 COS |

## 主题特色

- **粉白几何风**：灰调玫瑰 `#D4A0A8` 主色 + 柔和圆角 + 首页头图 CSS 对角斜切几何装饰
- **粒子背景**：canvas_nest 蓝色粒子网
- **暗色代码块**：darker 主题
- **本地搜索**：hexo-generator-search
- **字数统计**：文章字数 + 阅读时间
- **打字机副标题**：首页动态轮播文字
- **短链接**：hexo-abbrlink，文章链接从 `/2024/11/24/使用PicGo-腾讯云COS搭建md图床/` 变为 `/posts/4e5f.html`

## 插件

| 插件 | 用途 |
|------|------|
| hexo-theme-butterfly | Butterfly 主题 |
| hexo-renderer-pug | Pug 模板渲染 |
| hexo-renderer-stylus | Stylus CSS 渲染 |
| hexo-generator-search | 本地搜索索引 |
| hexo-wordcount | 字数 & 阅读时间统计 |
| hexo-abbrlink | 文章短链接（crc32 + hex） |

## 写文章

```bash
bash tools/new-post.sh      # 会提示输入标题
npx hexo new "文章标题"      # 或直接用命令
# 编辑 source/_posts/xxx.md
```

## 本地预览

```bash
bash tools/preview.sh
# 浏览器打开 http://localhost:4000
```

## 发布

```bash
bash tools/push.sh
# 输入提交信息 → git push → Actions 自动部署到 https://yenmor.github.io
```

Windows 用户把 `.sh` 换成 `.bat` 即可。

## 目录结构

```
yenmorBlog/
├── source/
│   ├── _posts/              ← Markdown 文章
│   └── img/                 ← 图片（头像、favicon 等）
├── _config.yml              ← Hexo 主配置（站点、URL、abbrlink）
├── _config.butterfly.yml    ← 主题配置（配色、特效、插件开关）
├── tools/                   ← 便捷脚本（new-post / push / preview）
├── themes/landscape/        ← Hexo 默认主题（未使用）
└── .github/workflows/       ← GitHub Actions 自动部署
```
