# Build stage
FROM node:16 as build

# Define o diretório de trabalho
WORKDIR /app

# Adiciona argumento para forçar rebuild
ARG CACHEBUST=1

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
FROM nginx:stable

# Copia os arquivos buildados
COPY --from=build /app/build /usr/share/nginx/html

# Expõe a porta 80
EXPOSE 80

# Inicia o nginx
CMD ["nginx", "-g", "daemon off;"]
