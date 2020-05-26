FROM ubuntu:latest

RUN apt-get update && apt upgrade -y 

#Setup du mot de passe root
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server mysql-server/root_password password unmotdepasse'"]
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password unmotdepasse'"]

#Installation de mysql
RUN apt install -y mysql-server nano

# Le port 3306 est celui pour mysql
EXPOSE 3306

# cette commande va ajouter des fonctionnalités de sécurité telles que restart le serveur si il y a une erreur
CMD mysqld_safe
