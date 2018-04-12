# Peer-teaching-Ruby-on-Rails

## La différence entre un site statique et un site dynamique

Un site statique est un site dont le contenu est fixe. Le site sera exactement le même, qu'il soit visité par Pierre, Paul ou Jacques. Par opposition, il existe aussi des sites dits dynamiques, dont le contenu s'adapte en fonction du visiteur. Un exemple très concret est celui de Facebook : la timeline de Pierre sera très differente de celle de Paul et de Jacques.

## Le MVC

Le MVC (pour Model View Controller) est un paradigme de programmation très utile pour réaliser des applications web. Ce concept de MVC permet de s'assurer que les utilisateurs ne puissent pas être en contact direct avec la base de donnée.

* Model ==> C'est une représentation du data (de la base de données)

* View ==> Ce que l'internaute voit dans son navigateur

* Controller ==> Recupère les requêtes de l'utilisateur et les transmet au Model si ces requetes sont ok (ne vont pas endommager le Model par exemple). Récupère de la part du modèle les informations qui l'interesse, puis transmet ces informations a la View, afin que la View puisse construire la page a présenter a l'internaute.

## Les routes

Pour comprendre les routes, je t'ai fait un petit exemple avec un surge.

J'ai créé 2 fichiers HTML : un index.html, qui est la page par défaut, ayant le code suivant : 

**index.html**

```html
<h1>Salut jeune mousaillon</h1>
```

Un fichier anto.html, avec le code suivant :

**anto.html**

```html
<h1>Salut Anto</h1>
```

Tu peux acceder au resultat du code écrit dans le fichier index.html [ici](http://peer-learning-rails.surge.sh). Pour acceder au code écrit dans anto.html, il suffit de rajouter /anto a la fin de l'url [comme ca](http://peer-learning-rails.surge.sh/anto) 

Le fait d'utiliser des routes permet ici de montrer des choses differentes a l'utilisateur en fonction de l'emplacement ou il se situe sur le site.

Autre exemple : Je ne verrai pas la même chose sur le site de facebook si je suis a facebook/messages ou si je suis a facebook/mon_username

Les routes permettent donc d'afficher differentes choses sur un même site en fonction de l'endroit ou se situe l'internaute.

## Les Bases de Données

Une base de donnée est un système pensé pour stocker des informations. La plupart des bases de données se composent de plusieurs tables (on peut assimiler une table a une feuille excel.)

Par exemple, dans le cadre d'un blog on pourrait avoir 2 tables (ou 2 feuilles excel si l'on décidait d'utiliser excel comme base de donnée) qui seraient la table "Articles" et la table "Authors".

La table Articles contiendrait par exemple 3 élements : 

* Un id d'article unique

* Le titre des articles

* Le contenu des articles

La table Authors contiendrait elle aussi 3 elements :

* Un id unique

* L'identité de l'auteur

* L'id de chaque article que l'auteur à écrit

L'ensemble de ces 2 tables pourraient constituer notre base de donnée.

## GET / POST

GET et POST sont 2 types de requêtes HTTP. GET correspond a une "demande" de data d'une ressource spécifique, alors que POST correspond pour sa part a un envoi de data.

Exemple de requête GET : Lorsque l'on effectue une recherche sur un moteur de recherche (on demande par exemple aux serveurs de Google de nous renvoyer des photos de chatons)

Exemple de requête POST : Lorsque l'on se connecte sur un site, on rentre ses informations (mail et mot de passe le plus souvent), puis l'on envoie ces informations aux serveurs. Ces serveurs verifient que ces informations sont exactes (.cf la partie Controller du MVC) avant de nous renvoyer la page qui nous interesse. L'envoi de notre mail et mot de passe se fait ici via la méthode POST.

## Le concept de migration

Une migration de base de donnée permet de changer la structures des donnees stockées. Elle permet aussi facilement de lier de futurs/nouveaux elements aux elements deja present.

Les migrations sont donc le plus souvent utilisées pour changer la structure d'une table/lier des elements.

## Les relations entre les models des BDD

Les models sont structurés de maniere extremement precise.

Cela permet aux informations d'etre organisées de manière logique pour l'app, qui va pouvoir recuperer une information rapidement lorsqu'elle celle ci est necessaire

## Les fonctions du CRUD

Un CRUD a 4 fonctionnalités, qui sont : 

* Create (équivalent SQL : INSERT) ==> Permet de créer des entrées dans la base de données

* Read (équivalent SQL : SELECT) ==> Permet de lire des entrées dans la base de données

* Update (équivalent SQL : UPDATE) ==> Permet de mettre a jour des entrées dans la base de données

* Delete (équivalent SQL : DELETE) ==> Permet de supprimer des entrées dans la base de données


