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
Le schema de base de données du projet Fedilab ne contient aucune clé étrangère explicite. <br/>
Pour trouver des clés étrangères explicites nous avons dans un premier temps procédé à une détection visuelle depuis le schéma de base et ensuite par la recherche au niveau des requêtes dans le code. <br/>
Il est à noter qu'avec la détection visuelle on a eu à repéter certaines colonnes communes à différentes tables mais qui se sont avérées être des faux négatifs car l'investigation dans le code a permis <br/>
de confirmer que ce ne sont pas des clés étrangères, c'est le cas par exemple d'attributs de type Boolean SENSITIVE qu'on retrouve dans les tables STATUSES_CACHE, USER_ACCOUNT et USER_ACCOUNT_TEMP.

![alt text](https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%201/Schema-enriched_by_implicit_FKs.JPG?raw=true)

Vous pouvez retrouver le pdf contenant [ici le résultat de cette recherche de clés étrangères implicites](https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%201/Schema-enriched_by_implicit_FKs.pdf)

### 1.3 Creation du schema logique enrichi
Retrouvez [ici le DDL du schema logique enrichi](https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%201/fedilabSQLlite_DDL_Logical_Schema_enriched.sql)  <br/>

Modèle entité-relation du schéma enrichi <br/>
![alt text](https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%201/ER_diagram_enriched.jpg?raw=true)

### 1.4 Creation du fichier PML
 apres SL enrichi, Adrian fait le PML 
## Step 2 : Analyse des requêtes

### Récupération des données
Dans le but d'analyser les requêtes du code Fedilab, nous avons installé SQLinspect.
Grâce à cela, nous avons récupérer  105 requêtes. Nous avons traité  et réorganisé ces données dans plusieurs Excel. Ensuite, nous avons utilisé ces Excel depuis PowerBi pour créer des graphes représentatifs.
Ceux-ci aident à mieux visualiser la structure des différentes requêtes.

### Analyse des données

Afin d'avoir une meilleur compréhension des explications, vous trouverez [ici les différents graphes](https://github.com/DepaepeAdrian/Fedilab-Project/blob/main/Annexes/Step%202/Query_Statistics_Schema%20.pdf) qui donnent une visualisation de la situation.
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

Il existe 18 tables dans le code DDL, elles se semble être toutes utilisées à l’exception de la table USER_ACCOUNT. 
Celle-ci est supprimée et remplacée par la table temporaire USER_ACCOUNT_TEMP. Qui n’est désormais plus une table temporaire mais une des tables principales de ma DB

Ce qui nous fait une utilisation de 94% des tables de la DB.



## Step 3 : What if ? 10 scénarios possibles.

### Scenario 1 

#### Supprimer la table USER_ACCOUNT_TEMP
la suppression de la table USER_ACCOUNT_TEMP ne change rien sur le fonctionnement de l'application; car elle a été créé pour faire une mise à jour de l'application à un moment donné.
après analyse des requettes nous avons tracé le déroulement de ces operations comme suit.
1) création de la table  USER_ACCOUNT et ajout des colonnes
2) création de la table USER_ACCOUNT_TEMP et ajout de colonnes à partir de la table USER_ACCOUNT
3) suppression de la table USER_ACCOUNT
4) renommage de la table USER_ACCOUNT_TEMP en USER_ACCOUNT


Rodrigue


### Scenario 2

 
#### Supprimer une colonne liée a une autre colonne (supression de la colonne USER_ID de la table USER_ACCOUNT)

la supression de la colonne USER_ID de la table USER_ACCOUNT provoquerai une panne de l'application car elle est la clé primaire de la table USER_ACCOUNT et elle sert aussi de clé étrangère pour referencer d'autres tables comme NOTIFICATION_CACHE, MAIN_MENU_ITEMS, BOOST_SCHEDULED, TIMELINE_CACHE,INSTANCES, STATUSES_STORES, STATUSES_CACHE, TIMELINE, SEARCH.

en plus il est noté dans le code SQL comme NOT NULL cequi revèle son importance pour l'application, si elle est supprimé les comptes des utilisateurs ne pourront plus etre identifiés.

Rodrigue

### Scenario 3
 
#### ajouter une colonne à la table table USER_ACCOUNT

l'ajout d'une colonne à table USER_ACCOUNT constitue l'ajout d'une information suplementaire dans la base de donnée de l'application; 
dans le cas ou elle est mappé dans le programe elle servira d'ajout d'une nouvelle fonctionalité.

Rodrigue 

### Scenario 4
 
#### Supprimer la table STATUSES_CACHE
La suppression de la table STATUSES_CACHE va entrainer un disfonctionnement au niveau de l'application car celle-ci son ID est utilisé dans la création d'autres tables.
Pour remédier à ces conséquences il faudra procéder à un refactoring au niveau de certaines tables de la base de données et aussi au niveau du code en supprimant toutes les reférences à cette table.

### Scenario 5
 
#### Supprimer la colonne URI de la table STATUSES_CACHE
La suppression de cette colonne n'aura aucune conséquence au niveau du schéma courant de la base de données, cependant il faudra procéder à des adaptations au niveau du code dans la classe StatusCacheDAO.java.<br/>
Toutes les références à cette colonnes devront être supprimées pour éviter des erreurs du genre NullpointerException.

### Scenario 6
 
#### Ajouter une nouvelle colonne dans la table STATUSES_CACHE
L'ajout d'une nouvelle colonne se fera par un nouveau script DDL pour cette table.<br/>
Une adaptation sera aussi nécessaire au niveau de la table StatusCacheDAO.java afin de définir la valeur de l'attribut qui va représenter cette colonne lors de la création d'une instance de cette table.

### Scenario 7
 
#### ajouter xx
Adrian Emoji table suppression

### Scenario 8
 
#### ajouter xx
Adrian je cherche

### Scenario 9
 
#### Suppression de la tables INSTANCES
La suppression d'une table supprimera définitivement la table et toutes ses données de la base de données.
la table a des contraintes de clés étrangères qui la référencent (12 tables). Ces tables devront être également supprimées avant de pouvoir supprimer la table, ou modifiées pour retirer la dépendance. Cette table semble donc être cruciale pour le fonctionnement de l'application, compte tenu du code SQLite.
kouakou 

### Scenario 10
 
#### Modification de la Table CUSTOM_EMOJI
Les modifications des colonnes sur la table CUSTOM_EMOJI sont possibles, à l'exception de la colonne INSTANCE, qui référence la table INSTANCES. Toute modification de cette colonne qui supprime cette entrée n'a aucun impact sur le fonctionnement de la table et de la base de donnée0. Par contre l'insertion ou la mise à jour d'une valeur de cette collone doit vérifier avant l'existence de cette valeur dans la table INSTANCE.

kouakou 



##  Step 4 : Critiques sur la DB et le projet 

### Points positifs

La DB est globalement bien écrite, les noms des tables et colonnes sont très explicites. Il a donc été facile de se repérer grâce aux noms retrouvés dans les tables. La nomenclature est globalement bien respectée. Une clé primaire est reconnaissable facilement car il y a toujours un complément _ID dans le nom de l’attribut. 
De plus, les attributs reliés d’une table à l’autre avec une FK ont le même nom ou presque le même. Ce qui a facilité le travail de recherche des clés étrangères, c’était un indice de base solide pour y commencer les recherches.


### Points negatifs
La non-spécification explicite des clés étrangères dans les tables 
Code pas trop commenté 
rodrigue
### Conclusion

