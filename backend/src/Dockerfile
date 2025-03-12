# Imagem base com JDK 17
FROM openjdk:17-jdk-slim

# Diretório de trabalho
WORKDIR /app

# Copiar o JAR já construído
COPY target/*.jar app.jar

# Variáveis de ambiente
ENV SPRING_PROFILES_ACTIVE=prod
ENV SPRING_DATASOURCE_URL=jdbc:postgresql://db:5432/tsmovie
ENV SPRING_DATASOURCE_USERNAME=postgres
ENV SPRING_DATASOURCE_PASSWORD=1234
ENV SPRING_JPA_HIBERNATE_DIALECT=org.hibernate.dialect.PostgreSQLDialect
ENV SPRING_JPA_DATABASE_PLATFORM=org.hibernate.dialect.PostgreSQLDialect
ENV SPRING_JPA_HIBERNATE_DDL_AUTO=create
ENV SPRING_JPA_GENERATE_DDL=true
ENV SPRING_JPA_SHOW_SQL=true
ENV SPRING_JPA_DEFER_DATASOURCE_INITIALIZATION=true
ENV SPRING_SQL_INIT_MODE=always
ENV SPRING_JPA_PROPERTIES_HIBERNATE_FORMAT_SQL=true

# Comando para iniciar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
