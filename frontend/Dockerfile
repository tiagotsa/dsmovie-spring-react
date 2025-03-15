# Build stage
FROM node:16-alpine as build

# Define o diretório de trabalho
WORKDIR /app

# Copia apenas os arquivos de dependência primeiro
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o restante dos arquivos
COPY . .

# Define a variável de ambiente para evitar tratamento de warnings como erros
ENV CI=false

# Build da aplicação
RUN npm run build

# Production stage
FROM nginx:alpine

# Copia os arquivos buildados
COPY --from=build /app/build /usr/share/nginx/html

# Configuração do nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expõe a porta 80
EXPOSE 80

# Inicia o nginx
CMD ["nginx", "-g", "daemon off;"]
