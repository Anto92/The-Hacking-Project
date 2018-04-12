# README

## The-Hacking-News

Pour la correction, il faut commencer par clone le repo, faire un ```bundle install --without production```, faire ensuite un ```rails db:migrate``` et enfin rentrer dans la console ```rails console```

Une fois dans la console, il faudra peupler la database.

Comme je sais que tu es flemmard, je vais t'aider ;)

Etape 1 : Création d'un utilisateur

* ```user1 = User.new```

* ```user1.username = "Anto"```

* ```user1.save```

Etape 2 : Création d'un link

* ```link1 = Link.new```

* ```link1.url = "https://www.google.fr/search?q=autres+chatons+mignons"```

* ```link1.user_id = 1```

* ```link1.save```

Etape 3 : Rédaction d'un commentaire (commentaire d'un lien)

* ```comment1 = Comment.new```

* ```comment1.link_id = 1```

* ```comment1.content = "Jsuis vrmt fan de tes chatons !"```

* ```comment1.save```

(Dans le cas ou l'on veut commenter un lien, on fournit un link_id et on ne fournit pas de comment_id)

Etape 3bis : Rédaction d'un commentaire (commentaire d'un commentaire)

* ```commentaire_du_commentaire = Comment.new```

* ```commentaire_du_commentaire.comment_id = 1```

* ```commentaire_du_commentaire.content = "Merci pour ton commentaire :)""```

* ```commentaire_du_commentaire.save```

(Dans le cas ou l'on veut commenter un commentaire, on fournit un comment_id et on ne fournit pas de link_id)

Faisons un dernier commentaire de commentaire avant de passerr aux exemples de fin

* ```second_commentaire_du_commentaire = Comment.new```

* ```second_commentaire_du_commentaire.comment_id = 1```

* ```second_commentaire_du_commentaire.content = "Mais de rien"```

* ```second_commentaire_du_commentaire.save```

On peut maintenant chercher tout ce qui nous interesse dans notre database.

**Voir tous les commentaires sur un lien**

```Comment.where(link_id: 1)```

**Voir tous les commentaires sur un commentaire**

```Comment.where(comment_id: 1)```

**Voir tous les liens qu'un utilisateur spécifique à posté**

```Link.where(user_id: 1)```

(...)