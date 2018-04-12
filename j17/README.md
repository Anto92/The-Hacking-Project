# README

## MOOCademy

Pour la correction, il faut commencer par clone le repo, faire un ```bundle install --without production```, faire ensuite un ```rails db:migrate``` et enfin rentrer dans la console ```rails console```

Une fois dans la console, il faudra construire un ou des cours, et une ou plusieurs lessons associées a ce(s) cours.

Pour cela, je t'invite a tapper dans la console (par exemple) 

```class1 = Cour.new```

```class1.title = "Maths"```

```class1.description = "Les opérations arithmétiques n'auront plus de secrets pr vous"```

```class1.save```

Bravo, tu a créé un cours dans la bdd !

Maintenant, ajoutons 2 lessons a ce cours

```less1 = Lesson.new```

```less1.title = "Les additions"```

```less1.body = "premier cours additions"```


Lions maintenant cette leçon au cours de Maths (qui a l'id 1 car c'est le premier cours que l'on a créé)

```less1.cour_id = 1```

```less1.save```

Et voila, notre première lesson est liée au cours de maths et enregistrée en bdd ! Créons maintenant une deuxième lesson au sein de ce cours

```less2 = Lesson.new```

```less2.title = "Les soustractions"```

```less2.body = "premier cours soustractions"```

```less2.cour_id = 1```

```less2.save```

Bravo, tu as fini !! Tu devrais maintenant avoir un resultat similaire à [ça](https://ibb.co/m5PSw6)