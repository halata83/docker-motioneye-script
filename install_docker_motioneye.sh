#!/bin/bash
sudo mkdir /media/motioneye
sudo mkdir /media/motioneye/config
sudo mkdir /media/motioneye/records
sudo chmod -R 777 /media/motioneye
echo "instaluju docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sleep 5
sudo usermod -aG docker lukas
echo "stahuju docker image motioneye"
docker pull halilucky/raspi4motioneye:v1
echo "spoustim docker image"
docker run -d --name="motioneye" -p 8765:8765 --hostname="motioneye" --device=/dev/video10 --device=/dev/video11 --device=/dev/video12 --device=/dev/video18 -v /etc/localtime:/etc/localtime:ro -v /media/motioneye/config:/etc/motioneye -v /media/motioneye/records:/var/lib/motioneye --restart="always" halilucky/raspi4motioneye:arm64_H264_v4l2m2m
