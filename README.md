Dockerfile for [FCMForMojo](https://github.com/RikkaW/FCM-For-Mojo) Server.

### Quick Start

```
# For CentOS/Fedora
yum install curl -y
curl -o- https://get.docker.com/ | bash
docker pull kotomeinyan/fcm-for-mojo
docker run -d kotomeinyan/fcm-for-mojo
# For Ubuntu/Debian
apt-get install curl -y
curl -o- https://get.docker.com/ | bash
docker pull kotomeinyan/fcm-for-mojo
docker run -d kotomeinyan/fcm-for-mojo
```

**Please make sure The port 5005 has been opened on the firewall**