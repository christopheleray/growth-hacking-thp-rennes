# Growth Hacking de The Hacking Project

## Presentation du site
Le site est composé de 3 landings pages différentes correspondant chacune à une manière d'acceder au site, en fonction des liens qui ont été envoyés à nos cibles.

Pour la création de ce site nous nous sommes réparti.e.s en deux équipes : une s'occupant de la partie front et une autre s'occupant de la partie back(scrapping et bots).
*****
## Acquisition des données

### Députés

Nous avons repris un travail effectué plus tôt dans la formation permettant de récuperer les addresses email des députés français en utilisant la gem nokogiri.
Nous avons ensuite utilisé mailjet pour envoyer un email à chacun de ces députés et leur donner le lien vers notre première LP.

### Twitter

Nous avons créé un bot twitter qui va rechrcher toutes les personnes qui follow le compte d'Open Classrooms afin de les follow, de fave leur dernier post et de leur envoyer un dm contenant le lien vers notre deuxième LP.
Ces taches s'éffectuent à raison d'une par heure afin de ne pas dépasser le nombre de requètes autorisées par jour par l'API twitter.
Nous avons ensuite utilisé le scheduler de Heroku pour que cette tache tourne en continu.

### Linkedin
*****
## Metrics
*****
## Pistes d'améliorations
