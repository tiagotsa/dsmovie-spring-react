#!/bin/bash

# Atualizar o sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instalar dependências
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    nginx

# Instalar Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Configurar Nginx
sudo tee /etc/nginx/sites-available/dsmovie << EOF
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:80;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

# Ativar o site
sudo ln -s /etc/nginx/sites-available/dsmovie /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
