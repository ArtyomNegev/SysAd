# Téléchargement image de base ubuntu
FROM ubuntu:latest

# Mise à jour du container
RUN apt-get update && apt upgrade -y 

#Setup du mot de passe root
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server mysql-server/root_password password TQ92aT9pt'"]
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password TQ92aT9pt'"]

#Installation de mysql
RUN apt-get install -y mysql-server

# Copie les fichiers de la base de données de base
ADD initDB /tmp/
ADD createDB.sql /tmp/
ADD insertDB.sql /tmp/

# Modifie les fichier pour leur donner le droit d'exécution 
RUN chmod u+x /tmp/initDB

# initdb crée la base de donnée par défaut
# à partir de createdb.sql et insertdb.sql
# Et lance le démon mysql
RUN /tmp/initDB

#Pour changer la configuration et rendre plus rapide la recherche 
COPY mysqld.cnf /etc/mysql/mysql.conf.d/

# Le port 3306 est celui pour mysql
EXPOSE 3306

# cette commande va ajouter des fonctionnalités de sécurité telles que restart le serveur si il y a une erreur
CMD mysqld_safe
