
# Etapa de construção
FROM node:16-alpine as build

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependências
COPY package.json yarn.lock ./

# Instala as dependências do projeto
RUN yarn install

# Copia todos os arquivos do projeto
COPY . .

# Realiza o build da aplicação
RUN yarn build

# Etapa de produção
FROM nginx:alpine

# Copia os arquivos buildados da etapa anterior para o diretório do nginx
COPY --from=build /app/build /usr/share/nginx/html

# Se você tiver configurações personalizadas do nginx, descomente a linha abaixo
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expõe a porta 80 para acesso à aplicação
EXPOSE 80

# Inicia o servidor nginx
CMD ["nginx", "-g", "daemon off;"]
