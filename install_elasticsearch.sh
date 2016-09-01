#! /usr/bin/env bash

version=2
if [[ -n "$1" ]]; then
    version=$1
fi

echo "-------------------- ElasticSearch Install ... -------------------"
rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
cat > /etc/yum.repos.d/elasticsearch.repo <<EOF
[elasticsearch-$version.x]
name=Elasticsearch repository for $version.x packages
baseurl=https://packages.elastic.co/elasticsearch/$version.x/centos
gpgcheck=1
gpgkey=https://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
EOF
yum update
yum install elasticsearch java-1.8.0-openjdk
systemctl restart elasticsearch.service
systemctl status elasticsearch.service
echo "--------------- ElasticSearch Install Successed -----------------"
