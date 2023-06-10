
# Jeux Olympiques
Modélisation d'une base de données

## Description du contexte et objectifs
Spécialisée dans la valorisation des données, votre société a décidé de commercialiser les données des Jeux Olympiques passés et futurs. 
Pour cela elle va mettre en place une API qui permettra aux clients de récupérer les données au format JSON.
L’ensemble de ces données sera stocké dans une base de données relationnelle.
Votre objectif est de réaliser le modèle de la base de données (MCD et MPD) qui doit stocker les résultats de toutes les épreuves sportives.

## Tâches à réaliser
- Créez un dépôt modélisation-bdd sur votre compte GitHub
- Réalisez le MLD (Modèle Logique de Données) avec Visual Paradigm ou un outil équivalent.
- Vous pouvez choisir UML ou Merise.
- Réalisez le MCD (Modèle Physique de Données) avec Visual Paradigm ou un outil équivalent.
- Vous pouvez choisir UML ou Merise.
- Réalisez un document PDF stockant les 2 diagrammes.
- Commitez et pushez ce document sur GitHub.

## Description des données
- Une session des jeux olympiques possède une année, une ville d’organisation, une saison
associée (été ou hiver), une date d’ouverture, une date de clôture.
	- Exemple : Jeux d’été de Paris 2024.
- Les athlètes ont un nom, un ou plusieurs prénoms, une date de naissance, un sexe, un poids,
une taille
	- On remarquera que le poids peut évoluer entre 2 sessions de JO.
	- Remarque sur la raison du stockage du poids : Cette notion de poids est importante
	dans les sports de combat notamment puisqu’elle détermine la catégorie dans
	laquelle l’athlète va combattre.
- Les athlètes sont associés à une équipe. Une équipe a un code et un libellé.
	- Le code correspond à un code international de 3 caractères qui peut être celui d’un
	pays ou d’une organisation.
		- Exemple : FRA
	- Le libellé correspond au libellé de l’équipe
		- Exemple : France
	- Un athlète peut changer d’équipe entre 2 sessions de JO
		- Par exemple aux derniers JO les athlètes de la Russie ont été rattachés à
		l’équipe du CIO et non de la Russie.
- Une épreuve a un nom et un statut (individuel, par équipe)
	- Ex : 110m haies femmes, individuel-
	- Ex : Football hommes, par équipe
	- Ex : Aviron Deux de couples hommes, par équipe
- Les épreuves sont rattachées à un Sport. Un sport a seulement un nom.
	- Ex : Athlétisme
- Les athlètes obtiennent un résultat sous la forme d’un classement et d’un score pour une
épreuve donnée.
	- Précisions sur les épreuves : On ne s’intéresse pas aux divers tours de qualification
	que certaines épreuves peuvent avoir. On ne s’intéresse qu’au résultat final de
	l’épreuve.
	- Le classement peut valoir :
		- OR pour une médaille d’or
		- ARGENT pour une médaille d’argent
		- BRONZE pour une médaille de bronze,
		- 4 pour une 4ème place, 5 pour une 5ème place, etc.
		- DISQ si l’athlète a été disqualifié et donc non classé.
	- Le score est une chaine libre et non obligatoire qui permet de préciser le résultat
	obtenu par l’athlète:
		- un temps pour une épreuve chronométrée (ex : 9’82’’ au 100m),
		- une distance pour une épreuve mesurée (ex : 65m au javelot)
		- un score de victoire (par exemple : 3-2 au football).
		- un motif de disqualification si l’athlète a été disqualifié (ex : DOPAGE)
		- Etc.
- Plusieurs athlètes peuvent obtenir le même classement pour une épreuve donnée
	- Par exemple pour une épreuve par équipe, tous les athlètes de l’équipe reçoivent la
	médaille d’OR.
- Un sport n’est pas forcément présent à toutes les sessions des JO
	- Par exemple le Karaté ne sera pas présent aux JO de Paris 2024 tandis que de
	nouveaux sports feront leur apparition comme le Surf ou l’escalade.
- Une épreuve n’est pas forcément présente à toutes les sessions des JO.
