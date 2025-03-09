#!/bin/bash

# Parar containers existentes
docker-compose -f docker-compose.prod.yml down

# Reconstruir as imagens
docker-compose -f docker-compose.prod.yml build

# Iniciar os serviços
docker-compose -f docker-compose.prod.yml up -d

# Verificar logs
docker-compose -f docker-compose.prod.yml logs -f
