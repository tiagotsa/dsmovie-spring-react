# ./frontend/Dockerfile

# --- Build stage ---
FROM node:16 as build

# Define o diretório de trabalho
WORKDIR /app

# --- RECEBER E USAR O ARGUMENTO DE BUILD ---
ARG REACT_APP_API_URL=/api
ENV REACT_APP_API_URL=${REACT_APP_API_URL}
# --- FIM ---

# Argumento opcional para cache bust
ARG CACHEBUST=1

# Copia arquivos de dependência
COPY package*.json ./

# Instala dependências
RUN npm install

# Copia o resto do código fonte
COPY . .

# Variável para o build do React
ENV CI=false

# Builda a aplicação usando a REACT_APP_API_URL
RUN npm run build

# --- Production stage ---
FROM nginx:stable

# Copia os arquivos buildados para o diretório do Nginx
COPY --from=build /app/build /usr/share/nginx/html

# --- COPIAR A CONFIGURAÇÃO CUSTOMIZADA DO NGINX ---
# Remove a configuração padrão
RUN rm /etc/nginx/conf.d/default.conf
# Copia a sua configuração
# IMPORTANTE: Verifique se o seu arquivo está em './frontend/nginx/default.conf'
# Se estiver em './frontend/default.conf', mude a linha abaixo para:
# COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
# --- FIM ---

# Expõe a porta
EXPOSE 80

# Inicia o Nginx
CMD ["nginx", "-g", "daemon off;"]
