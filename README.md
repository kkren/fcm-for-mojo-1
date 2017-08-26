# FCM for Mojo (Docker)
Dockerfile for [FCM For Mojo](https://github.com/RikkaW/FCM-For-Mojo) Server.

## Quick Start
#### Install Docker and curl:

For CentOS/Fedora

```
sudo yum install curl -y
curl -o- https://get.docker.com/ | bash
```

For Ubuntu/Debian

```
sudo apt-get install curl -y
curl -o- https://get.docker.com/ | bash
```

#### Get Dockerfile of FCM for Mojo:

```
docker pull kotomeinyan/fcm-for-mojo
docker run -d kotomeinyan/fcm-for-mojo
```

**Please make sure The port 5005 has been opened on the firewall**

**请确保 5005 端口在防火墙上是开启的**
