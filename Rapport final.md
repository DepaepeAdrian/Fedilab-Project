# Sofware evolution project : FEDILAB

## Introduction
Nous avons analyser le projet Fedilab dans le but de s'excercer dans la rétro ingénerie.
Ce rapport contient les grandes étapes de nos recherches : 
- La création du schéma physique et logique enrichi.
- Les différentes clés etrangères impliciques découvertes à l'aide de diverses techniques.
- Les statistiques relatives aux requêtes SQl se trouvant dans le code et critiquer la complexité de celles-ci
- Les 10 scénarios "What-if"
- Une critique général du schéma de la DB

Dans ce rapport vous trouverez des références qui vous redirigerons vers notre github. La-bas vous y trouverez nos annexes, schémas et explications.


## Step 1 : Schémas, rétro ingénerie et fichier PML

Veuillez trouver [ici le dossier contenant les exports de SQLInspect](https://github.com/DepaepeAdrian/Fedilab-Project/tree/main/Annexes/Step%201/export_SQLInspect)

### 1.1 Creation du schema logique
Retrouvez [ici le DDL du schema logique](https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%201/fedilabSQLlite_DDL_Logical_Schema.sql)

Modèle entité-relation du schéma de base <br/>
![alt text](https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%201/ER_diagram.jpg?raw=true)

### 1.2 Recherches sur les foreign keys implicites
Le schéma de base de données du projet Fedilab ne contient aucune clé étrangère explicite.<br>
Pour trouver des clés étrangères explicites nous avons dans un premier temps procédé à une détection visuelle depuis le schéma de base et ensuite par la recherche au niveau des requêtes dans le code.
Il est à noter qu'avec la détection visuelle on a eu à répéter certaines colonnes communes à différentes tables mais qui se sont avérées être des faux négatifs car l'investigation dans le code a permis de confirmer que ce ne sont pas des clés étrangères, c'est le cas par exemple d'attributs de type Boolean SENSITIVE qu'on retrouve dans les tables STATUSES_CACHE, USER_ACCOUNT et USER_ACCOUNT_TEMP.


![alt text](https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%201/Schema-enriched_by_implicit_FKs.JPG?raw=true)

Vous pouvez retrouver le pdf contenant [ici le résultat de cette recherche de clés étrangères implicites](https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%201/Schema-enriched_by_implicit_FKs.pdf)

### 1.3 Creation du schema logique enrichi
Retrouvez [ici le DDL du schema logique enrichi](https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%201/fedilabSQLlite_DDL_Logical_Schema_enriched.sql)  <br/>

Modèle entité-relation du schéma enrichi <br/>
![alt text](https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%201/ER_diagram_enriched.jpg?raw=true)

### 1.4 Creation du fichier PML
 Le fichier PML est disponible ici : [model.pm](https://https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%201/model.pml).

 Celui-ci a été créé dans un but théorique. Le code n'a pas pu être testé pour Fedilab car nous avons eu des difficultés a implémenter HyDRa.

Par contre, la syntaxe a pu être vérifiée à l'aide d'un projet use case disponible sur le GitHub de HyDRa.

La création de ce fichier a été l'étape la plus longue de ce projet, cela est fortement lié à la longueur de ce fichier. Chaque table, chaque relation et chaque clé a dû être exprimées dans la syntaxe PML.

 
## Step 2 : Analyse des requêtes

### Récupération des données
Dans le but d'analyser les requêtes du code Fedilab, nous avons installé SQLInspect.
Grâce à cela, nous avons récupérer  105 requêtes. Nous avons traité  et réorganisé ces données dans plusieurs Excel. Ensuite, nous avons utilisé ces Excel depuis PowerBi pour créer des graphes représentatifs.
Ceux-ci aident à mieux visualiser la structure des différentes requêtes.

### Analyse des données

Afin d'avoir une meilleur compréhension des explications, vous trouverez [ici les différents graphes](https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%202/Query_Statistics_Schema%20.pdf) qui donnent une visualisation de la situation.<br><br>
Sur le graphe de la première page, il est rapidement lisible que chaque type de requêtes n'est pas représenté de façon équivalente.
Il existe un gros podium composé des requêtes CREATE(37%), SELECT(29%) et ALTER (22%) qui à eux trois représentent 88% des requêtes.
Les douze pourcent restants se composent de trois autres types de requêtes DROP (5,7%) DELETE (4,7%) et INSERT (1%) qui sont ici sous représentées.

Ensuite, sur le graphe en page 2, il est évident que la longueur des requêtes est assez variable, ce qui est tout à fait normal.
Mais il est possible d'en sortir quelques statistiques intéressantes.
La grande majorité des requêtes (91,5%) ne dépasse pas les 38 mots. Toujours en majorité, 62% des requêtes ne dépassent 17 mots.
Ce qui pourrait tendre à croire que la majorité des requêtes sont assez simple, du fait que celles-ci soient assez courte.

Pour terminer, la répartition des requêtes dans les classes JAVA sont généralement regroupées par type de requête. (Graphe 3)
Sur les 105 requêtes, 72 d’entre-elles sont dans la classe SQLite. Cette classe regroupe les requêtes ALTER TABLE, CREATE, DELETE,DROP,INSERT. A l’exception de 2 requêtes qui se trouvent dans 2 autres classes distinctes.
Les 33 requêtes SELECT sont reparties dans 5 classes mais 30 d’entre-elles sont dans 2 classes NotificationCacheDAO et StatusCacheDAO.


### Pourcentage des tables utilisées

Il existe 18 tables dans le code DDL, elles semblent être toutes utilisées à l’exception de la table USER_ACCOUNT.
Celle-ci est supprimée et remplacée par la table temporaire USER_ACCOUNT_TEMP (plus de détails dans le point 3.1), qui n’est désormais plus une table temporaire mais une des tables principales de la DB.<br>

Ce qui nous fait une utilisation de 94% des tables de la DB.



## Step 3 : What if ? 10 scénarios possibles.

### Scenario 1 

#### Supprimer la table USER_ACCOUNT_TEMP
La suppression de la table USER_ACCOUNT_TEMP ne change rien sur le fonctionnement de l'application; car elle a été créé pour faire une mise à jour de l'application à un moment donné.
Après analyse des requêtes nous avons tracé le déroulement de ces opérations comme suit.
1) création de la table  USER_ACCOUNT et ajout des colonnes
2) création de la table USER_ACCOUNT_TEMP et ajout de colonnes à partir de la table USER_ACCOUNT
3) suppression de la table USER_ACCOUNT
4) renommage de la table USER_ACCOUNT_TEMP en USER_ACCOUNT


### Scenario 2

 
#### Supprimer une colonne liée a une autre colonne (supression de la colonne USER_ID de la table USER_ACCOUNT)

La suppression de la colonne USER_ID de la table USER_ACCOUNT provoquerait une panne de l'application car elle est la clé primaire de la table USER_ACCOUNT et elle sert aussi de clé étrangère pour référencer d'autres tables comme NOTIFICATION_CACHE, MAIN_MENU_ITEMS, BOOST_SCHEDULED, TIMELINE_CACHE,INSTANCES, STATUSES_STORES, STATUSES_CACHE, TIMELINE, SEARCH.<br>

En plus il est noté dans le code SQL comme NOT NULL ce qui révèle son importance pour l'application, si elle est supprimée les comptes des utilisateurs ne pourront plus être identifiés.

### Scenario 3
 
#### ajouter une colonne à la table table USER_ACCOUNT

L'ajout d'une colonne à table USER_ACCOUNT constitue l'ajout d'une information supplémentaire dans la base de donnée de l'application;
dans le cas où elle est mappée dans le programme elle servira d'ajout d'une nouvelle fonctionnalité. 

### Scenario 4
 
#### Supprimer la table STATUSES_CACHE
La suppression de la table STATUSES_CACHE va entrainer un disfonctionnement au niveau de l'application car son ID est utilisé dans la création d'autres tables.
Pour remédier à ces conséquences il faudra procéder à un refactoring au niveau de certaines tables de la base de données et aussi au niveau du code en supprimant toutes les références à cette table.

### Scenario 5
 
#### Supprimer la colonne URI de la table STATUSES_CACHE
La suppression de cette colonne n'aura aucune conséquence au niveau du schéma courant de la base de données, cependant il faudra procéder à des adaptations au niveau du code dans la classe StatusCacheDAO.java.
Toutes les références à cette colonnes devront être supprimées pour éviter des erreurs du genre NullpointerException.

### Scenario 6
 
#### Ajouter une nouvelle colonne dans la table STATUSES_CACHE
L'ajout d'une nouvelle colonne se fera par un nouveau script DDL pour cette table.
Une adaptation sera aussi nécessaire au niveau de la table StatusCacheDAO.java afin de définir la valeur de l'attribut qui va représenter cette colonne lors de la création d'une instance de cette table.

### Scenario 7
 
#### Renommer la table TIMELINES
Le renommage de la table TIMELINES n'aura pas de conséquences directes sur le schéma actuel de la base de données car celle-ci ne contient aucune référence explicite.
Cependant il faudra forcément répercuter le changement sans le code principalement dans les tables Sqlite.java et TimelinesDAO.java, ainsi que toutes autres références existantes dans le code.

### Scenario 8
 
#### Supprimer la colonne USER_ID de la table TIMELINES
Supprimer la colonne USER_ID de la table TIMELINES est possible sans impact direct sur la base de données. Cependant cela va entrainer un dysfonctionnement dans l'application.
Pour y remédier il faudra procéder à une mise à jour au niveau du code de toutes les références liées à cette colonne (Sqlite.java et TimelinesDAO.java).

### Scenario 9
 
#### Suppression de la tables INSTANCES
La suppression d'une table supprimera définitivement la table et toutes ses données de la base de données.
Au niveau du code la table a des contraintes de clés étrangères qui la référencent (12 tables).
Cette table semble donc être cruciale pour le fonctionnement de l'application, compte tenu du code SQLite.
Il est donc inenvisageable de supprimer cette table pour le bon fonctionnement de l’application.

### Scenario 10
 
#### Modification de la Table CUSTOM_EMOJI
Les modifications des colonnes sur la table CUSTOM_EMOJI sont possibles, mais des modifications de la colonne INSTANCE et USER_ID seront nuisible au bon fonctionnement.
Toutes modifications de ces colonnes n'ont aucun impact sur le fonctionnement de la table et de la base de données.
Par contre l'insertion ou la mise à jour d'une valeur de ces colonnes doit prendre en compte l'existence de cette valeur dans la table INSTANCES et USER_ACCOUNT.


##  Step 4 : Critiques sur la DB et le projet 

### Points positifs

La DB est globalement bien écrite, les noms des tables et colonnes sont très explicites. Il a donc été facile de se repérer grâce aux noms retrouvés dans les tables.
La nomenclature est globalement bien respectée. Une clé primaire est reconnaissable facilement car il y a toujours un complément ID dans le nom de l’attribut.<br>
De plus, les attributs reliés d’une table à l’autre avec une FK ont le même nom ou presque le même. Ce qui a facilité le travail de recherche des clés étrangères, c’était un indice de base solide pour y commencer les recherches.<br><br>
Les requêtes sont regroupées dans 3 classes principales ce qui permet de gérer plus facilement la gestion de la database.

### Points negatifs
La non-spécification explicite des clés étrangères dans les tables.<br><br>
Le Code n'est pas trop commenté en général.<br><br>
Mots réservés du langage SQL et/ou SQLite utilisés comme nom de table ou Attribut. Le code n'est pas facilement portable.<br><br>
L'utilisation de "TEXT" comme type des dates dans plusieurs tables. Il serait peut-être plus approprié d'utiliser le type de données "DATETIME" pour cette colonne.<br><br>
La gestion des jointures au niveau du code fait que la database n'est ni exploitable, ni compréhensible sans l'implémentation du code. Ceci peut créer des soucis.<br>
On pourrait par exemple supprimer les données d'une table sans respecter la contrainte d'intégrité; exemple supprimer une table qui est référencée par une autre table comme clé étrangère sans alerte.

### Conclusion
Ce travail nous a permis de faire la rétro-engineering d’une application en utilisation les outils vus en cours tels que SQLInspect, HyDRa et DB-main.<br>
En retrouvant la base de données complète avec ses spécifications.<br>
Ce projet est un bon exemple pour démontrer l’importance des clés étrangères explicites. L’absence de ces clés nous a été fortement chronophage.<br>
Mais la bonne nomenclature nous a permis, a contrario, de gagner un temps considérable dans notre  démarche de rétro-engineering.<br><br>
Le fait de travailler en groupe nous a permis de confronter nos idées et développer des techniques de travail en groupe qui nous seront certainement utiles à l’avenir.
