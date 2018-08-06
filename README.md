# <a href="https://tdd-rails.herokuapp.com/">TDD Rails</a>

Voici le repository Github du site <a href="https://tdd-rails.herokuapp.com/">TDD Rails</a>.

Ce site est un club privé et contient la Réponse de l'Univers.
Seuls les utilisateurs enregistrés peuvent accéder à la réponse...

# Instructions # 
Ce projet est une application Ruby on Rails permettant d'avoir des utilisateurs avec Login et Mot de passe et de vous entrainer aux Test-Driven-Development (TDD pour les intimes) 
Vous pouvez clonez ce projet, le visitez <a href="https://tdd-rails.herokuapp.com/">ici</a> ou le refaire from scratch grâce aux instructions.  

# Cloner ce repo et installer l'application #
Si vous souhaitez tester cette application en local, suivez les instructions suivante, elles vous permettrons d'installer l'application, de générer votre base de données et ces migrations puis de vous créer un serveur et d'heberger cette appli sur votre port [Localhost:3000](http://localhost:3000). Enjoy !

Commencez par forker le repo 

Rendez-vous dans votre dossier :
```sh 
cd Desktop/votre_dossier
```
Clonez l'application depuis votre repo
```sh
git clone https://github.com/Ton_Pseudo/TDD-rails
```
Rendez-vous dans le dossier de votre copie de l'application : 
```sh
cd TDD-rails
```
Installez les dépendances spécifiées dans le Gemfile :
```sh
bundle install
```
Générez votre base de donnée Postgre :
```sh
rails db:create
```
Lancez les migrations de la base de donnée :
```sh
rails db:migrate
```
Générez vos exemples utilisateurs :
```sh
rails db:seed
```
Initialisez un serveur sur le port 3000 :
```sh
rails server
``` 

Rendez-vous ensuite sur votre [Localhost:3000](http://localhost:3000) pour admirer le travail bien fait. 

Ensuite lancez la série de test que nous avons mis en place sur notre application pour vérifier son foncitonnement étape par étape lors de sa création. 

Lancez la commande : 

```sh
rails test
``` 

Cher correcteur/correctrice, si vous executez bien toutes ces commandes, tout devrait bien se passer.
Mettez-nous la note maximale.

# Refaire ce projet #
En suivant ce REAMDME.md, tu pourras recréer cette application from scratch, Enjoy ! 

Commence par créer une appli rails avec Postgre 
```sh 
rails new -d postgresql nomdetasuperappli
```
puis tu peux lancer ton Bundle Install comme ceci : 
```sh
bundle install 
``` 
et enfin, générer ta base de donnée avec : 
```sh
rails db:create
``` 
-- 
Pour continuer, nous allons créer un systeme de CRUD complet pour les utilisateurs, regarde la magie opérer en utilisant cette commande : 
```sh
rails g scaffold User firstname:string lastname:string email:string
```
Et hop ! Ta migrations, tes champs utilisateurs, tes views et même le controller sont créer automatiquement, stylé non ? 
Lance dès maintenant tes migrations et le tour est jouer : 
```sh 
rails db:migrate
```
À présent nous allons créer ton premier controlleur pour les pages statiques de ton site ainsi que les views correspondantes :
```sh 
rails g controller static_pages home theclub
``` 
Enfin avant d'aller plus loin, nous allons mettre notre appli en production. Pour cela, utilise les commandes suivantes : 
```sh
heroku create nomdetasuperappli
``` 
tu devrais avoir ceci dans ton terminal : 
```sh 
Creating ⬢ tdd-rails... done
https://nomdetasuperappli.herokuapp.com/ | https://git.heroku.com/nomdetasuperappli.git
```

Par la suite nous allons générer des mots de passes cryptés pour tes utilisateurs. 

Commencons par installer la gem Bcrypt comme ceci : 
Dans ton Gemfile, ajoute la ligne suivante : 
```sh 
gem 'bcrypt'
```

puis dans ton model User ajoute ceci, tout en haut : 
```sh 
require 'bcrypt'
``` 
Ensuite nous allons ajouter le champs mot de passe au model utilisateur, voici la commande pour générer la migration : 
```sh 
rails generate migration add_password_digest_to_users password_digest:string
```
refait ensuite un bundle install :
```sh 
bundle install 
```
et une migration :
```sh 
rails db:migrate
```

<!--- (Readme en cours de rédaction) --->

## Créateurs : La Fameuse Fine Équipe ##

Derrière cet énième repository stylé se cache...
* <a href="https://github.com/AniMoure">Anisoara</a>
* <a href="https://github.com/TheFSilver">François D.</a>
* <a href="https://github.com/skageraz">Jeremy Rak</a>
* <a href="https://github.com/Titouax">Titouan</a>

## Remerciements ##

Nous remercions l'auteur du livre <a href="https://www.railstutorial.org/book/beginning">Ruby on Rails Tutorial: Learn Web Development with Rails</a>, Michael Hartl, sans qui nous ne serions pas parvenu à complêter cet exercice.
