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
docker build -t SEU_USUARIO_DOCKERHUB/nginx-l4:latest .
docker push SEU_USUARIO_DOCKERHUB/nginx-l4:latest
```

3. Edite o arquivo `docker-compose.yml` e substitua `<SERGIO_DOCKERHUB>` pelo seu nome de usuário.

> A imagem usa Nginx com **proxy TCP (Camada 4)** ouvindo na porta **8080** e encaminhando para `webserver:80`.
> Também inclui `ping` e `curl` instalados.

## Como executar

> Pré-requisitos: VirtualBox e Vagrant instalados na máquina host.

1. Ajuste, se necessário, o **hostname** no `Vagrantfile` para corresponder aos primeiros nomes da dupla.
2. (Opcional) Ajuste as senhas do MySQL no `docker-compose.yml`.
3. Suba a VM e deixe o Ansible fazer todo o provisionamento:

```bash
vagrant up
```

4. Ao final, acesse: **http://192.168.56.145:8080**

## Notas

- O `Vagrantfile` usa `ansible_local`, então não precisa ter Ansible instalado na máquina host.
- A rede privada/VBox usa `192.168.56.145` como IP fixo. Caso a rede 192.168.56.0/24 conflite, ajuste conforme necessário.
- Apenas o container `webproxy` é exposto para fora da rede do Docker (porta 8080), conforme o enunciado.
- O trecho final do PDF menciona `192.168.57.1XY:8080`; aqui padronizamos em `192.168.56.1XY` = `192.168.56.145:8080`, em alinhamento com a especificação inicial.
```
# Projeto-02--Docker-com-Vagrant-e-Ansible
# Projeto-02--Docker-com-Vagrant-e-Ansible
