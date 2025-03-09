# DSMovie Application

Full-stack application built with Spring Boot and React.

## Project Structure

- `backend/`: Spring Boot application
- `frontend/`: React application
- `docker/`: Docker configurations and database scripts

## Requirements

- Java 17
- Node.js 16+
- Docker
- Maven

## Development Setup

1. Backend:
```bash
cd backend
mvn spring-boot:run
```

2. Frontend:
```bash
cd frontend
yarn install
yarn start
```

3. Using Docker:
```bash
docker-compose up
```

## Architecture

- Backend: Spring Boot REST API
- Frontend: React with TypeScript
- Database: PostgreSQL
- Containerization: Docker

## Pipeline Structure

1. Build Stage
   - Backend build with Maven
   - Frontend build with Node/Yarn
   - Docker image builds

2. Test Stage
   - Unit tests
   - Integration tests
   - Frontend tests

3. Deploy Stage
   - Container deployment
   - Environment configuration
   - Health checks

## Docker compose
entre na pasta docker
e no terminal digite
   docker compose up
   
para sair execute  
control C X2 para parar