# Imagem base com JDK 17
FROM eclipse-temurin:17-jre-alpine

# Diretório de trabalho
WORKDIR /app

# Copiar o JAR já construído
COPY target/*.jar app.jar

# Variáveis de ambiente
ENV SPRING_PROFILES_ACTIVE=prod \
    SPRING_DATASOURCE_URL=jdbc:postgresql://db:5432/tsmovie \
    SPRING_DATASOURCE_USERNAME=postgres \
    SPRING_DATASOURCE_PASSWORD=1234 \
    SPRING_JPA_HIBERNATE_DIALECT=org.hibernate.dialect.PostgreSQLDialect \
    SPRING_JPA_DATABASE_PLATFORM=org.hibernate.dialect.PostgreSQLDialect \
    SPRING_JPA_HIBERNATE_DDL_AUTO=create \
    SPRING_JPA_GENERATE_DDL=true \
    SPRING_JPA_SHOW_SQL=true \
    SPRING_JPA_DEFER_DATASOURCE_INITIALIZATION=true \
    SPRING_SQL_INIT_MODE=always \
    SPRING_JPA_PROPERTIES_HIBERNATE_FORMAT_SQL=true

# Expor porta
EXPOSE 8080

# Comando para iniciar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
