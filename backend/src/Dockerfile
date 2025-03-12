# Build stage
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app

# Copiar apenas os arquivos de dependência primeiro
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

# Baixar dependências
RUN mvn dependency:go-offline

# Copiar o código fonte
COPY src src

# Build com logs detalhados
RUN mvn clean package -DskipTests -X

# Run stage
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
COPY --from=build /app/src/main/resources/import.sql /app/import.sql

# Define as variáveis de ambiente padrão
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
