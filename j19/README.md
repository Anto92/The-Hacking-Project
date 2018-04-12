# README

## The-Hacking-Pinterest

Pour la correction, il faut commencer par clone le repo, faire un ```bundle install --without production```, faire ensuite un ```rails db:migrate``` et enfin rentrer dans la console ```rails console```

Une fois dans la console, il faudra peupler la database.

Comme je sais que tu es flemmard, je vais t'aider ;)

Etape 1 : Création d'un utilisateur

* ```user1 = User.new```

* ```user1.username = "Anto"```

* ```user1.save```

Etape 2 : Création d'un Pin

* ```pins1 = Pin.new```

* ```pins1.url = "https://www.google.fr/search?&q=chatons+mignons"```

* ```pins1.user_id = 1```

* ```pins1.save```

Etape 3 : Création de 2 commentaire

* ```comm1 = Comment.new```

* ```comm1.content = "Trop mignons ces chatons"```

* ```comm1.pin_id = 1```

* ```comm1.user_id = 1```

* ```comm1.save```


* ```comm2 = Comment.new```

* ```comm2.content = "J'adore les chatons"```

* ```comm2.pin_id = 1```

* ```comm2.user_id = 1```

* ```comm2.save```


Libre a toi de créer d'autres utilisateurs, Pins ou commentaires :)

Tu peux ensuite retrouver ce que tu veux facilement dans la base de donnée avec la methode where, comme ci dessous par exemple:

**Les commentaires sur le pin ayant l'id 1 (le premier pin que l'on crée)**

* ```Comment.where(pin_id: 1)```

Tu verras les 2 commentaires que l'on a créé, car ces 2 commentaires se réferent au pin ayant l'id 1 (car comm1 et comm2 ont un pin_id égal a 1)

**Retrouve tous les pins qu'a posté un utilisateur**

* ```Pin.where(user_id: 1)```

