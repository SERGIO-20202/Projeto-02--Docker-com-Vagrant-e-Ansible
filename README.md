# Projeto 02 — Docker com Vagrant e Ansible (Wordpress + Nginx L4 + MySQL)

Este repositório contém os **três entregáveis** solicitados e os artefatos auxiliares para a imagem personalizada do Nginx.

- IP definido: **192.168.56.145** (com XY = 45)
- Hostname: **sergio.henrique**
- Acesso final: **http://192.168.56.145:8080**

## Estrutura

```
.
├── Vagrantfile
├── playbook_ansible.yml
├── docker-compose.yml
└── nginx/
    ├── Dockerfile
    └── nginx.conf
```

## Requisito da Imagem Nginx personalizada

Antes de rodar o `Vagrantfile`, publique a imagem no Docker Hub:

1. Crie uma conta (ou use a sua) no Docker Hub.
2. No diretório `nginx/`, faça o build e push:

```bash
cd nginx
docker build -t SERGIO_DOCKERHUB/nginx-l4:latest .
docker push SERGIO_DOCKERHUB/nginx-l4:latest
```
vagrant up
```

3. Ao final, acesse: **http://192.168.56.145:8080**

