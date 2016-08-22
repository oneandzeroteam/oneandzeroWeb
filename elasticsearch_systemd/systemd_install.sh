#!/bin/sh

#elasticsearch를 systemd서비스에 등록해주는 스크립트입니다.
#최초 설치시 한번만 실행해주면 됩니다.
#elasticsearch의 기본 설치경로는 /opt/elasticsearch입니다.

sudo cp ./elasticsearch.service /lib/systemd/system/elasticsearch.service
sudo mkdir /var/run/elasticsearch
sudo chown -R oaz:oaz /var/run/elasticsearch
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
