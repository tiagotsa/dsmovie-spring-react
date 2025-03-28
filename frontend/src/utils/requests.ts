// No ambiente de produção, usamos o endereço completo do backend
export const BASE_URL = process.env.REACT_APP_BACKEND_URL || "http://localhost:8080";