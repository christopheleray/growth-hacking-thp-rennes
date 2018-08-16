# Growth Hacking de The Hacking Project
![logo THP](https://www.thehackingproject.org/assets/thp-logo-5f2f06c9444205a88123ca1de74646970e5a1dfb03698d02db33e5e62a60d6cd.png)

## Presentation du site
[landing page 1](https://thp-rennes-growth-hacking.herokuapp.com)

[landing page 2](https://thp-rennes-growth-hacking.herokuapp.com/twitter)

[landing page 3](https://thp-rennes-growth-hacking.herokuapp.com/linkedin)


Le site est composé de 3 landings pages différentes correspondant chacune à une manière d'acceder au site, en fonction des liens qui ont été envoyés à nos cibles.

Pour la création de ce site nous nous sommes réparti.e.s en deux équipes : une s'occupant de la partie front et une autre s'occupant de la partie back(scrapping et bots).

#### Présentation de notre équipe

Nous sommes l'équipe de Rennes de la session 5 de The Hacking Project, à savoir Christophe Leray, Léona Chevrel, Rémi Samson, Romain Saillour et Sandrine Le Breton. Voici les liens vers nos github réspectifs :

[Christophe Leray](https://github.com/christopheleray)

[Léona CHevrel](https://github.com/RainbowQuartz)

[Rémi Samson](https://github.com/breizzh)

[Romain Saillour](https://github.com/RomainSai)

[Sandrine Le Breton](https://github.com/Ertemelle)
*****
## Acquisition des données

#### Députés

Nous avons repris un travail effectué plus tôt dans la formation permettant de récuperer les addresses email des députés français en utilisant la gem **nokogiri**.
Nous avons ensuite utilisé **mailjet** pour envoyer un email à chacun de ces députés et leur donner le lien vers notre première LP.
Le code de cette fonctionnalité est stocké dans les services `app/services/scrap_parlement.rb` et `app/services/send_massmailing.rb`

Pour executer les programmes lancer les commandes suivantes: 

` $ ScrapParlement.perform`

` $ SendMassmailing.new.perform`

#### Twitter

Nous avons créé un bot **twitter** qui va rechrcher toutes les personnes qui follow le compte d'Open Classrooms afin de les follow, de fave leur dernier post et de leur envoyer un dm contenant le lien vers notre deuxième LP.
Ces taches s'éffectuent à raison d'une par heure afin de ne pas dépasser le nombre de requètes autorisées par jour par **l'API twitter**.
Le code pour ce bot est stocké dans le service `app/services/open_classrooms_twitter.rb`

Pour executer le programme lancer les commandes suivantes: 

`$ OpenClassroomTwitter.new.perform`

#### Linkedin

Nous avons ultilisé **watir** pour envoyer un message privé à chaque personne présente sur le groupe Facebook *Startup Weekends*.

#### Envoie newsletter via le maillet à a liste de subscriber mailchimp

Utilisation de la `gem 'mailchimp-api'`

Création d'un service SendNewsletter dans app/services/send_newsletter.rb afin de se connecter à mailchimp et envoye run email a chaque personne de la liste.

Pour executer le programme lancer les commandes suivantes: 

` $ SendNewsletter.new.perform `


*****
## Metrics

Un compte sur google anaytlics a  été crée et lié a l'app afin de récupere le nombre de visiteur. 
*****
## Pistes d'améliorations
Utiliser le scheduler heroku pour automatiser les taches mais cela nécesite d'entrer une carte bancaire et potentiellement de payer du temps serveur pour les tests. 

*****
