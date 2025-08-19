#!/bin/bash
set -e

echo "🔹 Atualizando pacotes..."
sudo apt update -y
sudo apt upgrade -y

echo "🔹 Adicionando chave GPG do VirtualBox..."
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | gpg --dearmor | sudo tee /usr/share/keyrings/oracle-virtualbox.gpg > /dev/null
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | gpg --dearmor | sudo tee -a /usr/share/keyrings/oracle-virtualbox.gpg > /dev/null

echo "🔹 Configurando repositório do VirtualBox..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

echo "🔹 Atualizando pacotes novamente..."
sudo apt update -y

echo "🔹 Instalando VirtualBox 7.1..."
#!/bin/bash
set -e

echo "🔹 Atualizando pacotes..."
sudo apt update -y
sudo apt upgrade -y

# ===============================
# INSTALAR VIRTUALBOX
# ===============================
echo "🔹 Baixando VirtualBox 7.1..."
VB_VERSION=7.1.4
wget -q https://download.virtualbox.org/virtualbox/${VB_VERSION}/virtualbox-7.1_${VB_VERSION}-163444~Debian~bookworm_amd64.deb -O virtualbox.deb

echo "🔹 Instalando VirtualBox..."
sudo dpkg -i virtualbox.deb || sudo apt -f install -y

# ===============================
# INSTALAR VAGRANT
# ===============================
echo "🔹 Baixando Vagrant 2.4.1..."
VAGRANT_VERSION=2.4.1
wget -q https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}-1_amd64.deb -O vagrant.deb

echo "🔹 Instalando Vagrant..."
sudo dpkg -i vagrant.deb || sudo apt -f install -y

# ===============================
# VERIFICAÇÃO
# ===============================
echo "🔹 Verificando instalações..."
echo -n "Vagrant: " && vagrant --version
echo -n "VirtualBox: " && virtualbox --help | head -n 1

echo "✅ Instalação concluída com sucesso!"
udo apt install -y virtualbox-7.1

echo "🔹 Baixando Vagrant..."
VAGRANT_VERSION=2.4.1
wget -q https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}-1_amd64.deb

echo "🔹 Instalando Vagrant..."
sudo dpkg -i vagrant_${VAGRANT_VERSION}-1_amd64.deb || sudo apt -f install -y

echo "🔹 Verificando instalações..."
echo -n "Vagrant: " && vagrant --version
echo -n "VirtualBox: " && virtualbox --help | head -n 1

echo "✅ Instalação concluída com sucesso!"
