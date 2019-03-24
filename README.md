# COSPORT

=> cosport.herokuapp.com 

 À propos 

Cosport est une application en ligne permettant de creer ou de trouver des rendez-vous centrés sur le sport. 
Elle a pour ambition de créer du lien social à travers l' organisation de créneaux sportifs à plusieurs (appelés cosports).
Pour creer ou rejoindre un cosport l'utilisateur doit s'enregistrer et/ou se connecter à son compte. 

Géolocalisation

Cosport est une application ayant recours à la géolocalisation. Pour une meilleure expérience , l'utilisateur devra autoriser son navigateur à pouvoir le localiser pour ce site.

Recherche de cosports

Une fois connecté , l'utilisateur peut accéder à une liste de créneaux sportifs séléctionnés spécifiquement selon la demande effectuée dans la barre de recherche de la landing-page. Cette recherche s'effectue selon 3 critères : le nom de la ville ou il souhaite trouvé son cosport, le nom du sport et la date du cosport. 
Le remplissage de ces 3 critères n'est pas une condition necessaire à la requête : en laissant ces champs vides , l'utilisateurs peut avoir accès à la liste intégrale des cosports dans le futur qui sont referencés sur la base de données.

Création de cosports

L'utilisateur enregistré peut creer son cosport en cliquant sur le bouton "Proposer un cosport" dans la navbar.
La plupart des critères du formulaires sont obligatoires pour le réferencement des créneaux. 
Le cosport est une donnée géolocalisée. Pour celal'utilisateur doit pointé un lieu de rendez-vous sur la carte.
Par défaut le point de rendez-vous est situé au centre de la ville séléctionnée.

Cosports aujourd'hui 

Cosport propose une fonctionnalité permettant de visualiser tous les cosports situés autour de l'utilisateur et qui auront lieu dans la journée en cours. Une icone orange vous pointe sur la carte pour préciser vortre position sur la carte. Si le navigateur refuse la géolocalisation , la carte pointe par défaut sur le centre de Paris.
Chaque icone représente le sport définissant le cosport. Pour plus de précision sur celui-ci l'utilisateur doit cliquer sur l'icône.

Présentation du cosport

La page d'affichage du cosport présente les éléments le caractérisant.L'utilisateur peut demander à s'inscrire au cosport en cliquant sur le bouton rejoindre. Il sera alors en attente de validation. Le point de rendez-vous est définit par une zone sur la carte. Cette zone est remplacée par un marqueur précis une fois que la participation de l'utilisateur été validée par le créateur de l'évenement. Il est impossible de définir le point de rendez-vous précis à partir du centrede lazone quand la participation de l'utilisateur n'est pas validée, car un algorythme change le centre du cercle à chaque rafraichissement.  

Gestion des participations

Une notification apparait au niveau du bouton profil quand des participants demandent à rejoindre  un evenetment que l'utilisateur a crée. Un lien vers la page de gestion des participation apparait alors dans la dropdown du profil.
L'utilisateur peut alors validé ou refusé la participation d'une personne à son cosport.

Mode admin

Un mode admin a été conçu pour le site.
Ce mode permet de bannir des utilisateurs ou supprimer des événements sportifs si ceux si s'avèrent problématiques.

Prévisions

Cosport espére évoluer au cours des prochains mois.
Parmis les fonctionnalités que l'équipe compte implémenter , on trouve celle du defilement de profil façon "tinder". L'utilisateur gerera les validations de participations de cette façon.
La fonctionnalité de recherche de cosports compte elle aussi évoluer. Un moteur de recherche de lieu permettra de référencer des sports dans des endroits autres que les grandes villes. 
Les cosports pourront être aussi référencer en focntion du niveau de l'utilisateur dans tel ou tel sport. Ainsi un bon joggeur pourra crée un cosport de running destinés uniquement aux bon joggeurs , par exemple.
Un système de régie publicitaire destiné uniquement à la vente de produits ou services rattachés au sport peut aussi être mis en place . Ainsi un utilisateur aimant le tennis sera mis en lien avec des magasin de tennis. La main_map pourra referencé des points de ventes d'articles de sports .
