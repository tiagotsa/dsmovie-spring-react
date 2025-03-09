# Use a imagem oficial do PostgreSQL
FROM postgres:13-alpine

# Variáveis de ambiente para configuração do banco
ENV POSTGRES_DB=tsmovie
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=1234

# Copiar o arquivo de backup para o container
COPY backup-tsmovie.sql /docker-entrypoint-initdb.d/

# O PostgreSQL automaticamente executará qualquer arquivo .sql em /docker-entrypoint-initdb.d/
# durante a primeira inicialização do container.