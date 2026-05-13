---
title: 使用PicGo + 腾讯云COS搭建md图床（发布版）
date: 2024-11-24 16:47:00
tags: [工具, 图床, PicGo, 腾讯云COS]
---

# 1. 下载并安装PicGO

---

- **PicGO** 是一款快捷上传图片到存储服务并生成链接的实用工具。官网：[PicGo](https://picgo.github.io/PicGo-Doc/zh/)

- **访问下载页面：**
  - GitHub Release：[Releases · Molunerfinn/PicGo](https://github.com/Molunerfinn/PicGo/releases)
  - 选择自己的平台下载即可

![PicGO](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123213529347.png)

**注意：** Windows下启动PicGO时，它会默认启动到托盘图标处，并非没有启动。

![托盘图标](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123213907955.png)

---

# 2. 配置腾讯云COS服务

---

## 1. 首先准备一个腾讯云账号，这里按下不表。

## 2. 获取对象存储服务
访问 [腾讯云COS](https://cloud.tencent.com/product/cos?Is=sdk-topnav)

## 3. 打开控制台-对象存储-创建存储桶

### 3.1. 基本信息

![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123214500525.png)

依照上图配置即可。若选择私有读写，PicGo生成的链接将无法访问。

### 3.2. 高级可选配置

![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123220037174.png)

按个人需求开启即可。

### 3.3. 确认并搭建

**直接确认即可。**

![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123220231178.png)

---

# 3. 配置腾讯云访问密钥

---

## 1. 访问：

```
https://console.cloud.tencent.com/cam/capi
```

![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123220758206.png)

新建密钥并记录下 **APPID**，**SecretId** 和 **SecretKey**。  
这些是PicGo和其他程序访问腾讯云服务的凭证，请务必妥善保存。

---

# 4. 配置PicGo上的腾讯云COS

---

![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123221230018.png)

### 必填项配置说明：

- **图床配置名**：自定义名称即可
- **SecretId, SecretKey, AppId**：以上步骤中保存的凭证
- **存储区域** 和 **Bucket**：请返回 **控制台-对象存储** 获取

![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123221857465.png)

点击 **配置管理**，找到如下区域：

![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123222032907.png)

- **Bucket** 是存储桶名称  
- **存储区域** 是所属地域（如：**ap-guangzhou**）

最后，建议填写存储路径，方便后续管理。

![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123222417706.png)

---

# 5. 剩下的配置

---

- **设置默认图床：**

  ![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251124163958456.png)

- **其他好用的功能：**

  ![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123222728419.png)

- **链接格式：**  
  上传的图片会自动在剪贴板保存成对应的链接格式，设置为Markdown时，上传完可以直接在笔记中快捷粘贴。

- **快捷上传：**  
  剪贴板图片最常用，可以通过微信截图直接上传到图床，非常方便。
