DROP DATABASE IF EXISTS OGROD;
CREATE DATABASE IF NOT EXISTS OGROD;
USE OGROD;

CREATE TABLE Athlete(
   id_athlete INT,
   nom VARCHAR(100) NOT NULL,
   date_naissance DATE NOT NULL,
   sexe ENUM('Homme', 'Femme', 'Neutre') NOT NULL,
   taille_cm REAL NOT NULL,
   PRIMARY KEY(id_athlete)
);

CREATE TABLE Equipe(
   id_equipe INT,
   code VARCHAR(3) NOT NULL,
   libelle VARCHAR(100) NOT NULL,
   PRIMARY KEY(id_equipe),
   UNIQUE(code),
   UNIQUE(libelle)
);

CREATE TABLE Epreuve(
   id_epreuve INT,
   statut ENUM('Individuel','par équipe') NOT NULL,
   nom VARCHAR(100) NOT NULL,
   PRIMARY KEY(id_epreuve),
   UNIQUE(nom)
);

CREATE TABLE Sport(
   id_sport INT,
   nom VARCHAR(100) NOT NULL,
   PRIMARY KEY(id_sport),
   UNIQUE(nom)
);

CREATE TABLE Classement(
   id_classement INT,
   rang INT NOT NULL,
   label VARCHAR(100) NOT NULL,
   PRIMARY KEY(id_classement)
);

CREATE TABLE Prenoms(
   Id_Prenom INT,
   prenom VARCHAR(100) NOT NULL,
   PRIMARY KEY(Id_Prenom),
   UNIQUE(prenom)
);

CREATE TABLE Session(
   Id_Session INT,
   annee SMALLINT NOT NULL,
   ville_organisation VARCHAR(100) NOT NULL,
   saison enum('ETE','HIVER') NOT NULL,
   date_ouverture DATE,
   date_cloture DATE,
   PRIMARY KEY(Id_Session),
   UNIQUE(annee),
   UNIQUE(date_ouverture),
   UNIQUE(date_cloture)
);

CREATE TABLE Participant(
   Id_participant INT,
   poids_pesée_kg DECIMAL(5,2) NOT NULL,
   Id_Session INT NOT NULL,
   id_equipe INT NOT NULL,
   id_athlete INT NOT NULL,
   PRIMARY KEY(Id_participant),
   UNIQUE(id_athlete),
   FOREIGN KEY(Id_Session) REFERENCES Session(Id_Session),
   FOREIGN KEY(id_equipe) REFERENCES Equipe(id_equipe),
   FOREIGN KEY(id_athlete) REFERENCES Athlete(id_athlete)
);

CREATE TABLE Resultat(
   Id_Resultat INT,
   score VARCHAR(100),
   id_classement INT NOT NULL,
   PRIMARY KEY(Id_Resultat),
   FOREIGN KEY(id_classement) REFERENCES Classement(id_classement)
);

CREATE TABLE Categorie(
   Id_catégorie INT,
   nom VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_catégorie),
   UNIQUE(nom)
);

CREATE TABLE possede(
   id_athlete INT,
   Id_Prenom INT,
   PRIMARY KEY(id_athlete, Id_Prenom),
   FOREIGN KEY(id_athlete) REFERENCES Athlete(id_athlete),
   FOREIGN KEY(Id_Prenom) REFERENCES Prenoms(Id_Prenom)
);

CREATE TABLE Concourir(
   id_epreuve INT,
   Id_participant INT,
   Id_Resultat INT,
   nbre_participants INT NOT NULL,
   PRIMARY KEY(id_epreuve, Id_participant, Id_Resultat),
   FOREIGN KEY(id_epreuve) REFERENCES Epreuve(id_epreuve),
   FOREIGN KEY(Id_participant) REFERENCES Participant(Id_participant),
   FOREIGN KEY(Id_Resultat) REFERENCES Resultat(Id_Resultat)
);

CREATE TABLE est_associee (
    id_epreuve INT,
    id_sport INT,
    Id_catégorie INT,
    PRIMARY KEY (id_epreuve , id_sport , Id_catégorie),
    FOREIGN KEY (id_epreuve)
        REFERENCES Epreuve (id_epreuve),
    FOREIGN KEY (id_sport)
        REFERENCES Sport (id_sport),
    FOREIGN KEY (Id_catégorie)
        REFERENCES Categorie (Id_catégorie)
);