wildCine_Symfony

auteur: Léopold Assogba

1. Charger films.sql dans phpmyadmin

2. Si composer n'est pas installé: Installer composer >> https://getcomposer.org/download/ <<
(Download and run Composer-Setup.exe - it will install the latest composer version whenever it is executed.)

3. Ouvrir la console se placer dans le repertoire  /www de wamp64 ou répertoire équivalent pour xamp ou manp

4. Installer Symfony avec la commande suivante dans la console:  composer create-project symfony/website-skeleton wildCine_Symfony

5. Placer les fichiers dans le repertoire

6. Executer la commande suivante: composer require knplabs/knp-paginator-bundle

7. Modifier le fichier .env à la racine du repertoire
modifier la ligne 18 >> DATABASE_URL=mysql://db_user:db_password@127.0.0.1:3306/db_name

Et remplacer les champs par votre identifiant (USER) et votre mot de passe dans phpmyadmin sans oublier le nom de la base de données
modifier la ligne 18 >> DATABASE_URL=mysql://VOTREUSER:VOTREMOTDEPASSE@127.0.0.1:3306/wildcine_db

8. Ouvrir la console et se placer dans le repertoire du dossier wildCine_Symfony et executer la commande php bin/console server:run Ouvrir le navigateur à l'adresse localhost:8000

Merci

CodeWars: 

Lien vers ma solution: https://www.codewars.com/kata/reviews/554245a044e65ac10f00006b/groups/583483375961c22a4f0003fd

Lien vers mon profil: https://www.codewars.com/users/L%C3%A9opold%20/completed
