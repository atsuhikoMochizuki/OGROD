DROP DATABASE IF EXISTS OGROD;
CREATE DATABASE OGROD;
USE OGROD;

CREATE TABLE Athlete(
   id_athlete INT AUTO_INCREMENT,
   nom VARCHAR(100) NOT NULL,
   date_de_naissance DATE,
   sexe ENUM('Homme', 'Femme', 'Neutre') NOT NULL,
   taille_cm DOUBLE,
   PRIMARY KEY(id_athlete)
);

CREATE TABLE Equipe(
   id_equipe INT AUTO_INCREMENT,
   code VARCHAR(3) NOT NULL,
   libelle VARCHAR(100) NOT NULL,
   PRIMARY KEY(id_equipe),
   UNIQUE(code),
   UNIQUE(libelle)
);

CREATE TABLE Sport(
   id_sport INT AUTO_INCREMENT,
   nom VARCHAR(100) NOT NULL,
   PRIMARY KEY(id_sport),
   UNIQUE(nom)
);

CREATE TABLE Classement(
   id_classement INT AUTO_INCREMENT,
   rang INT NOT NULL,
   label VARCHAR(100) NOT NULL,
   PRIMARY KEY(id_classement)
);

CREATE TABLE Prenom(
   Id_Prenom INT AUTO_INCREMENT,
   prenom VARCHAR(100) NOT NULL,
   PRIMARY KEY(Id_Prenom),
   UNIQUE(prenom)
);

CREATE TABLE Session(
   Id_Session INT AUTO_INCREMENT,
   annee SMALLINT,
   ville_organisation VARCHAR(100),
   saison enum('ETE','HIVER') NOT NULL,
   date_ouverture DATE,
   date_cloture DATE,
   PRIMARY KEY(Id_Session),
   UNIQUE(annee),
   UNIQUE(date_ouverture),
   UNIQUE(date_cloture)
);

CREATE TABLE couple_athlete_poids_(
   Id_cple_athlete_poids INT AUTO_INCREMENT,
   poids_kg DECIMAL(5,2) NOT NULL,
   id_athlete INT NOT NULL,
   PRIMARY KEY(Id_cple_athlete_poids),
   FOREIGN KEY(id_athlete) REFERENCES Athlete(id_athlete)
);

CREATE TABLE couple_equipe_athletePoids_(
   Id_couple_equipe_poidsAthlete INT AUTO_INCREMENT,
   Id_cple_athlete_poids INT NOT NULL,
   id_equipe INT NOT NULL,
   PRIMARY KEY(Id_couple_equipe_poidsAthlete),
   FOREIGN KEY(Id_cple_athlete_poids) REFERENCES couple_athlete_poids_(Id_cple_athlete_poids),
   FOREIGN KEY(id_equipe) REFERENCES Equipe(id_equipe)
);

CREATE TABLE couple_sessionJO_equipeAthletePoids_(
   Id_couple_session_cplEquipPoidAthlete INT  AUTO_INCREMENT,
   Id_couple_equipe_poidsAthlete INT NOT NULL,
   Id_Session INT NOT NULL,
   PRIMARY KEY(Id_couple_session_cplEquipPoidAthlete),
   FOREIGN KEY(Id_couple_equipe_poidsAthlete) REFERENCES couple_equipe_athletePoids_(Id_couple_equipe_poidsAthlete),
   FOREIGN KEY(Id_Session) REFERENCES Session(Id_Session)
);

CREATE TABLE Categorie(
   Id_categorie INT AUTO_INCREMENT,
   nom VARCHAR(70) NOT NULL,
   PRIMARY KEY(Id_categorie),
   UNIQUE(nom)
);

CREATE TABLE Epreuve(
   id_epreuve INT AUTO_INCREMENT,
   nom VARCHAR(150) NOT NULL,
   statut ENUM('Individuel','par équipe') NOT NULL,
   id_sport INT NOT NULL,
   PRIMARY KEY(id_epreuve),
   UNIQUE(nom),
   FOREIGN KEY(id_sport) REFERENCES Sport(id_sport)
);

CREATE TABLE couple_Epreuve_Categorie(
   Id_couple_Epreuve_Categorie INT AUTO_INCREMENT,
   id_epreuve INT NOT NULL,
   Id_categorie INT NOT NULL,
   PRIMARY KEY(Id_couple_Epreuve_Categorie),
   FOREIGN KEY(id_epreuve) REFERENCES Epreuve(id_epreuve),
   FOREIGN KEY(Id_categorie) REFERENCES Categorie(Id_categorie)
);

CREATE TABLE Resultat(
   id_resultat INT AUTO_INCREMENT,Prenom
   score VARCHAR(100),
   Id_couple_session_cplEquipPoidAthlete INT NOT NULL,
   Id_couple_Epreuve_Categorie INT NOT NULL,
   id_classement INT NOT NULL,
   PRIMARY KEY(id_resultat),
   FOREIGN KEY(Id_couple_session_cplEquipPoidAthlete) REFERENCES couple_sessionJO_equipeAthletePoids_(Id_couple_session_cplEquipPoidAthlete),
   FOREIGN KEY(Id_couple_Epreuve_Categorie) REFERENCES couple_Epreuve_Categorie(Id_couple_Epreuve_Categorie),
   FOREIGN KEY(id_classement) REFERENCES Classement(id_classement)
);

CREATE TABLE regroupe(
   id_athlete INT,
   id_equipe INT,
   nombre_dathletes INT,
   PRIMARY KEY(id_athlete, id_equipe),
   FOREIGN KEY(id_athlete) REFERENCES Athlete(id_athlete),
   FOREIGN KEY(id_equipe) REFERENCES Equipe(id_equipe)
);

CREATE TABLE possede(
   id_athlete INT,
   Id_Prenom INT,
   nbreNprenoms INT NOT NULL,
   PRIMARY KEY(id_athlete, Id_Prenom),
   FOREIGN KEY(id_athlete) REFERENCES Athlete(id_athlete),
   FOREIGN KEY(Id_Prenom) REFERENCES Prenom(Id_Prenom)
);
