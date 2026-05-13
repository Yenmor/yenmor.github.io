---
title: 使用PicGo + 腾讯云COS搭建md图床
date: 2024-11-24 16:40:00
tags: [工具, 图床, PicGo, 腾讯云COS]
---

# 1. 下载并安装PicGO
***
<br>
- ## PicGO是一款快捷上传图片到存储服务并生成链接的实用工具，官网： [PicGo](https://picgo.github.io/PicGo-Doc/zh/)

 - ## 访问下载页面 ：<br>
	 github release：[Releases · Molunerfinn/PicGo](https://github.com/Molunerfinn/PicGo/releases)
	 选择自己的平台下载即可
	 ![img](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123213529347.png)


**注意windows下启动PicGo会启动到托盘图标处，并非没有启动**

![img](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123213907955.png)

# 2. 配置腾讯云COS服务
***

## 1. 首先准备一个腾讯云账号，这里按下不表<br><br>

## 2. 获取对象存储服务<br>
 访问 :
```
https://cloud.tencent.com/product/cos?Is=sdk-topnav
```

## 3. 打开控制台-对象存储-创建存储桶

###     1. 基本信息

![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123214500525.png)
依照上图配置即可，开私有读写的话PicGo生成的链接不带密钥，无法访问<br>
###    2. 高级可选配置
![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123220037174.png)


按个人需求开启即可<br>
### 3. 确认并搭建<br>
  **直接确认即可**
 ![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123220231178.png)

# 3. 配置腾讯云访问密钥
***

## 1. 访问：<br>
```
https://console.cloud.tencent.com/cam/capi
```

![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123220758206.png)
<br>
新建密钥并记录下**APPID**, **SecretId** 和**SecretKey**。
这是PicGo和其他程序可以访问腾讯云服务的凭证，务必好好保存

# 4. 配置PicGo上的腾讯云COS
***
![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123221230018.png)
### 可以看到有这么几个必填项:

- 图床配置名：自己起即可<br>
- **SecretId, SecretKey, AppId** 为上一步保存的那三项<br>
- **存储区域** 和 **Bucket** 则要回到 **控制台-对象存储** <br>


![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123221857465.png)
<br>  点 **配置管理**
  找到如下区域：<br>
![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123222032907.png)
<br>
**Bucket** 就是**存储桶名称**<br>
**存储区域** 就是**所属地域**后面那一串英文，我这里是**ap-guangzhou**

最后建议存储路径还是写一下，方便后续管理<br>
![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123222417706.png)

# 5. 剩下的配置
***
<br>- **设置默认图床**<br>
![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251124163958456.png)<br>
- **其他好用的功能**
![](https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20251123222728419.png)

- 链接格式<br>
	上传的图片会自动在剪贴板保存成对应的链接格式
	设置为markdown的话，上传完可以直接在笔记里快捷粘贴
<br>
- 快捷上传<br>
	剪贴板图片最常用，可以微信截图直接上传到图床，非常方便