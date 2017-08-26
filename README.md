# FCM for Mojo (Docker)
Dockerfile for [FCM For Mojo](https://github.com/RikkaW/FCM-For-Mojo) Server.
[简体中文](#入门)

## Quick Start
### Install Docker and curl:

CentOS/Fedora:

```
sudo yum install curl -y
curl -o- https://get.docker.com/ | bash
```

Ubuntu/Debian:

```
sudo apt-get install curl -y
curl -o- https://get.docker.com/ | bash
```

### Get Dockerfile:

```
docker pull kotomeinyan/fcm-for-mojo
docker run -d kotomeinyan/fcm-for-mojo
```

**Please make sure The port 5005 has been opened on the firewall**

## 入门
## 安装 Docker 和 curl

CentOS/Fedora

```
sudo yum install curl -y
curl -o- https://get.docker.com/ | bash
```

Ubuntu/Debian

```
sudo apt-get install curl -y
curl -o- https://get.docker.com/ | bash
```

### 获取 Dockerfile

```
docker pull kotomeinyan/fcm-for-mojo
docker run -d kotomeinyan/fcm-for-mojo
```

**请确保 5005 端口在防火墙上是开启的**
