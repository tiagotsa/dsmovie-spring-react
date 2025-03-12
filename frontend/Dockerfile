# Build stage
FROM node:16-alpine as build

# Define o diretório de trabalho
WORKDIR /app

# Copia apenas os arquivos de dependência primeiro
COPY package.json yarn.lock ./

# Instala as dependências
RUN yarn install --frozen-lockfile --network-timeout 600000

# Copia o restante dos arquivos
COPY . .

# Define a variável de ambiente para evitar tratamento de warnings como erros
ENV CI=false

# Build da aplicação
RUN yarn build

# Production stage
FROM nginx:alpine

# Copia os arquivos buildados
COPY --from=build /app/build /usr/share/nginx/html

# Cria diretório para configuração do nginx
RUN mkdir -p /etc/nginx/conf.d

# Configuração do nginx para desabilitar cache
RUN echo 'server { \
    listen 80; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html index.htm; \
        try_files $uri $uri/ /index.html; \
        add_header Cache-Control "no-store, no-cache, must-revalidate"; \
        add_header Pragma "no-cache"; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Expõe a porta 80
EXPOSE 80

# Inicia o nginx
CMD ["nginx", "-g", "daemon off;"]
