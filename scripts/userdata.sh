#!/bin/bash

dnf update -y

dnf install nginx -y

systemctl enable nginx

systemctl start nginx

echo "<h1>CloudForge Deployed via Terraform</h1>" > /usr/share/nginx/html/index.html