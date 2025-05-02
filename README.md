Installation automatique de Docker et Docker Compose

## Instructions d'installation

1. Copier le script `install_docker.sh` sur votre machine.

2. Donner les droits d'exécution :

   ```bash
   chmod +x install_docker.sh
   ```

3. Exécuter le script :

   ```bash
   ./install_docker.sh
   ```

## Fonctionnalités du script

* Installation de `sudo` si nécessaire
* Mise à jour des paquets
* Installation des dépendances (`ca-certificates`, `curl`, `gnupg`, `lsb-release`)
* Ajout de la clé GPG officielle de Docker
* Ajout du dépôt officiel Docker
* Installation de Docker Engine et du plugin Docker Compose
* Démarrage et activation du service Docker
* Ajout de l'utilisateur courant au groupe `docker`

## Vérification de l'installation

Après l'exécution du script, exécuter :

```bash
docker run hello-world
docker compose version
```

## Remarque importante

Après installation, il est nécessaire de se déconnecter puis se reconnecter pour appliquer l'ajout au groupe `docker`. Il est aussi possible d'exécuter :

```bash
newgrp docker
```
