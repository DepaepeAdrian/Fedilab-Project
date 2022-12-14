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
Les douzes pourcent restants se composent de trois autres types de requêtes DROP (5,7%) DELETE (4,7%) et INSERT (1%) qui sont ici sous représentées.

Ensuite, sur le graphe en page 2, il est évident que la longueur des requêtes est assez variable, ce qui est tout à fait normal.
Mais il est possible d'en sortir quelques statistiques intéressantes.
La grande majorité des requêtes (91,5%) ne dépasse pas les 38 mots. Toujours en majorité, 62% des requêtes ne dépassent 17 mots.
Ce qui pourrait tendre à croire que la majorité des requêtes sont assez simple, du fait que celles-ci soient assez courte.

Adrian fin

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
 
#### ajouter xx
Mamadou  statuses_cache

### Scenario 5
 
#### ajouter xx
Mamadou  statuses_cache

### Scenario 6
 
#### ajouter xx
Mamadou  statuses_cache

### Scenario 7
 
#### ajouter xx
Adrian Emoji table

### Scenario 8
 
#### ajouter xx
Adrian je cherche

### Scenario 9
 
#### ajouter xx
kouakou au choix sur autre table que statuses_cache &  Emoji  & USER_TEMP

### Scenario 10
 
#### ajouter xx
kouakou au choix sur autre table que statuses_cache &  Emoji  & USER_TEMP






##  Step 4 : Critiques sur la DB et le projet 

### Points positifs

### Points negatifs

### Conclusion

