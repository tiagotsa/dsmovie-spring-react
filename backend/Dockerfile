# Build stage
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

# Variáveis de ambiente para configuração do banco de dados
ENV SPRING_PROFILES_ACTIVE=prod
ENV SPRING_DATASOURCE_URL=jdbc:postgresql://db:5432/tsmovie
ENV SPRING_DATASOURCE_USERNAME=postgres
ENV SPRING_DATASOURCE_PASSWORD=1234

# Configurações do JPA
ENV SPRING_JPA_HIBERNATE_DDL_AUTO=update
ENV SPRING_JPA_SHOW_SQL=true
ENV SPRING_JPA_PROPERTIES_HIBERNATE_FORMAT_SQL=true

# Removendo o comando ENTRYPOINT para evitar execução automática
# ENTRYPOINT ["java", "-jar", "app.jar"]
