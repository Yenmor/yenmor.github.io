---
title: Windows 下配置 AutoBangumi 全自动追番教程
date: 2025-04-17 00:13:00
tags: [自动化, 追番, Docker]
---

# **Windows 下配置 AutoBangumi 全自动追番教程**

- [x] 自动追番，解放双手！


### 1. 安装 docker desktop

- AutoBangumi 使用 docker 部署，对于没有接触过 docker 的人来讲比较陌生，总之简单的说 docker 就是一个简单的 linux 虚拟机，但是比 linux 虚拟机轻量的多。
- linux 上安装 docker 比较便利（其实可能也不便利） windows 上我们一般用 wsl2 来安装 linux 虚拟机，那么对于 docker 也是一样的，我们**需要基于 wsl2 的虚拟化技术**，才能启用基于 docker 的容器化技术
- 对于 wsl2 的安装这里不多赘述，总之注意一下，**对于下先前安装过 virtualbox 或者 vmware 的机子，安装 wsl2 大概率有坑**，作者的经验是重装系统然后直接装 wsl2 可以解决 99% 的问题
- 对于已经能正常使用 wsl2 的机器，**直接运行 docker 官网的安装程序**即可轻松完成 docker desktop 的安装

```http
# 官网地址
https://www.docker.com/products/docker-desktop/
```

> 注意：建议全程开着代理软件的 tun 模式来进行操作，建议准备健全的网络环境，win上部署比较容易也是因为默认你们都有代理软件

### 2. 用 docker-compose 部署 AutoBangumi 和 qBittorrent 镜像

- 首先确定你的电脑上的 docker 命令能够成功运行，在终端输入 docker 应该能看到反馈

- ```shell
  PS C:\Users\你的用户名> docker --help
  Usage:  docker [OPTIONS] COMMAND
  
  A self-sufficient runtime for containers
  
  Common Commands:
   **** 这些省略了不然太长了 ****
  
  Run 'docker COMMAND --help' for more information on a command.
  
  For more help on how to use Docker, head to https://docs.docker.com/go/guides/
  ```

- 现在，去找一个干净的，你能找到的目录，为这整个项目创建一个文件夹

> 建议平时就培养好整理目录的习惯哦

- 在其中创建一个 AutoBangumi 文件夹，再创建一个 qBittorrent 文件夹
- 在两个文件夹下各创建一个 `docker-compose.yml` 文件
- 分别在其中复制这两段内容

```yaml
# autobangumi/docker-compose.yml

version: "3.8"

services:
  AutoBangumi:
    image: "ghcr.io/estrellaxd/auto_bangumi:latest"
    container_name: AutoBangumi
    volumes:
      - ./config:/app/config
      - ./data:/app/data
    ports:
      - "7892:7892"
    network_mode: bridge
    restart: unless-stopped
    dns:
      - 8.8.8.8
    environment:
      - TZ=Asia/Shanghai
      - PGID=0
      - PUID=0
      - UMASK=022
```

```yaml
version: "2"
services:
  qbittorrent:
    image: superng6/qbittorrent
    container_name: qbittorrent
    environment:
      - PUID=1026
      - PGID=100
      - TZ=Asia/Shanghai
    volumes:
      - ./config:/config
      - ./downloads:/downloads
    ports:
      - 6881:6881
      - 6881:6881/udp
      - 8080:8080
    restart: unless-stopped

```

> 这里需要着重解释的是文件中 volumes 和 ports 这两项
>
> volumes：docker 运行后所有的文件都是临时的，关闭容器的时候会清除，这意味着我们的配置和番剧都没有了，使用 volumes 可以把宿主机的目录和 docker内的目录绑定，达到持久化数据的效果，其中 ./config 就代表当前目录（docker-compose.yml）下的 config 文件
>
> ports: docker 容器一般都把其服务开放一个端口出来，port 代表把容器开放的端口对应到宿主机的端口上，宿主机侧可以按需修改，容器内的得进入容器修改 (一般不用改因为单个容器一般单个服务)



- 现在，**分别进入**两个目录，**各运行一遍 **`docker compose up -d` 命令
- 现在，你可以打开 docker desktop 应用，看到如下情况说明成功了

<img src="https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20260416232537009.png"/>

<img src="https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20260416235230280.png"/>

如果你没有改 compose 文件，那么访问`http://localhost:7892/` 即可进入 autobangumi 后台，访问 `localhost:8080`可以进入 qBittorrent 后台

你可以先访问 qBittorrent 后台，去 webui 设置改掉初始密码

<img src="https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20260416232955936.png" width=50%>

- 然后访问 autobangumi 后台，完成初始配置，下载器设置界面就输入你 qBittorrent 的用户名和密码，地址就填你访问 webui 的那个地址 (8080) 端口

> 注意！！！！！！！！！！！！！
>
> 这里不能填 localhost！！！ 内网环境下，应当填从路由器那边分配下来的 ip 比如小米路由器就是 192.168.31.xxx 具体可以打开终端输入 ipconfig 查看



- rss 订阅源暂且跳过



### 3. 使用 mikan project 获取番剧订阅 rss 链接

- 官网： `https://mikanani.kas.pub/`

对于网站如何使用，可以去看这个帖子 https://www.himiku.com/archives/auto-bangumi.html 这里做一些细节补充



- 获取总 rss 订阅链接

<img src="https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20260416235149015.png"/>

> 对着两个箭头指着的这个地方，右键选择复制链接即可（这就是个浏览器自带的操作，不要期待右键会弹出什么别的应用菜单之类的！！！）



- 复制的链接粘贴到 autobangumi 后台就可以了‘



### 4. 其他注意的点

- 建议打开番剧补全功能，这样不止 rss 订阅有消息的时候才下载，老番和之间的集也会下载
- 剩下的功能可以按需开启

<img src="https://tuchuangh-1386261756.cos.ap-guangzhou.myqcloud.com/blog/20260416235211787.png"/>