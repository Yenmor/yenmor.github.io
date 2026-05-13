---
title: 一句话完美配置！将你的 Claude Code 接入 deepseek！
date: 2026-05-13 20:37:14
tags: [Claude,ai,deepseek,大模型]
---

# 一句话完美配置！将你的 、Claude Code 接入 deepseek！

### 一句话配置

对于在 **windows** 上已安装 Claude Code ，且有**已有** **deepseek** **apikey** 的用户，请替换你的 `C://用户/用户名/.claude/settings.json` 文件为如下内容
> 看不懂这里的请继续往下看哦
```json
{
  "env": {
    "ANTHROPIC_AUTH_TOKEN": "替换成你的 deepseek api token",
    "ANTHROPIC_BASE_URL": "https://api.deepseek.com/anthropic",
    "ANTHROPIC_MODEL": "deepseek-v4-pro[1m]",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "deepseek-v4-pro[1m]",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "deepseek-v4-pro[1m]",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "deepseek-v4-flash",
    "CLAUDE_CODE_SUBAGENT_MODEL": "deepseek-v4-flash",
    "CLAUDE_CODE_EFFORT_LEVEL": "max"
  },
  "autoCompactEnabled": true
}
```
### 背景

deepseek v4 系列的推出以及持续一个月的大减价, 以及其**无与伦比的缓存命中率**，让所有人用很少的价钱就可以用得起 Claude Code 这样及其耗输入 token 的 AI 编码工具，而无需去抢 coding plan
> 目前多模态仍然是缺陷，没有办法代替前端编码

但是实际上涉及到思考模式一类的问题，deepseek 的接入并不是仅接入一个模型名加 api 就是最佳实践，官方给了详尽的文档但是没有给一句话配置，故有此 blog 

### 安装 Claude Code CLI

网络环境允许时直接运行下面命令即可
```shell
irm https://claude.ai/install.ps1 | iex
```

> 注意代理软件可能需要开 tun 模式

### 获取 deepseek apikey

1. 访问`https://platform.deepseek.com/`并登录
2. 在开放平台页面充十块钱（任意金额就行看你用多久）
3. 访问`https://platform.deepseek.com/api_keys`
4. 创建 apikey 并复制保存 （不要暴露给别人）

### 配置 Claude Code

同文章开头，替换`C://用户/用户名/.claude/settings.json`

### Claude Code 的基本使用方法

1. 终端切换到你想要让 Claude 参与的项目目录，输入 claude 唤起
2. 输入 `/init` 命令，Claude 会浏览整个目录里的文件，并给自己创造一个 CLAUDE.md 文件用于存放他对这个项目的理解
3. 输入 `/model` 命令可以选择不同的模型
4. 输入 `/compact` 可以让 Claude 总结上下文，咱们的模型没原生那么强的话有时候要常用这个，特别是感觉他降智了的话
5. `ctrl + o ` 可以切换工作模式
6. `! + 内容` 可以临时执行终端命令
7. `exit` 是退出
8. `/clear` 可以清除上下文
