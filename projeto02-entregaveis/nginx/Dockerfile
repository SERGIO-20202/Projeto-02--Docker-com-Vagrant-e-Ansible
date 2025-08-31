FROM nginx:latest

# Instalar utilitários exigidos (ping e curl)
RUN apt-get update &&     apt-get install -y --no-install-recommends iputils-ping curl &&     rm -rf /var/lib/apt/lists/*

# Substituir configuração para L4 (stream) 8080 -> webserver:80
COPY nginx.conf /etc/nginx/nginx.conf

# Expor porta 8080
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
