// Use '/api' como fallback, que funciona com o proxy Nginx
export const BASE_URL = process.env.REACT_APP_API_URL ?? "/api";
