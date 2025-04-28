#!/bin/bash

# Installer sudo si absent
echo "=== Installation de sudo si nécessaire ==="
apt update
apt install -y sudo

# Mettre à jour les paquets
echo "=== Mise à jour des paquets ==="
sudo apt update
sudo apt upgrade -y

# Installer les dépendances
echo "=== Installation des dépendances ==="
sudo apt install -y ca-certificates curl gnupg lsb-release

# Ajouter la clé GPG officielle de Docker
echo "=== Ajout de la clé GPG Docker ==="
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release && echo "$ID")/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Ajouter le dépôt Docker
echo "=== Ajout du dépôt Docker ==="
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$(. /etc/os-release && echo "$ID") \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installer Docker Engine et Docker Compose plugin
echo "=== Installation de Docker Engine et Docker Compose Plugin ==="
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Démarrer et activer Docker
echo "=== Démarrage de Docker ==="
sudo systemctl enable docker
sudo systemctl start docker

# Ajouter l'utilisateur au groupe docker
echo "=== Ajout de l'utilisateur actuel au groupe docker ==="
sudo usermod -aG docker $USER

echo ""
echo "=== Installation terminée ==="
echo "Pense à te déconnecter et te reconnecter pour utiliser Docker sans sudo."
echo "Pour tester : docker run hello-world"
