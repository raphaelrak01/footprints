-- Auteur : RAKOTONAIVO AINA RAPHAEL

-- Création de la base de donnée
CREATE DATABASE IF NOT EXISTS suivi_etudiants;

-- Utilisation de la base de donnée
USE suivi_etudiants;

-- Tables avec leurs attributs:
-- etudiants :
-- id_etudiant : clé primaire (unique, ne peut pas être nulle, identifie chaque étudiant)
-- nom :
-- prenom :

-- Connections :
-- id_connection : clé primaire (s'auto incrémente)
-- id_etudiant : clé étrangère 
-- date
-- heure_de_connection
-- duree : (facultatif)
-- heure_de_deconnection : (facultatif)

-- Commandes :
-- id_commandes : clé primaire (s'auto incrémente)
-- - id_connection : clé étrangère
-- date
-- - heure : (facultatif)
-- - commande

-- SQL : 
-- Création de la table etudiant
CREATE TABLE IF NOT EXISTS etudiants (
    id_etudiant INT NOT NULL,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    mention VARCHAR(255),
    note FLOAT,
    PRIMARY KEY (id_etudiant)
);

-- Création de la table connections
CREATE TABLE IF NOT EXISTS connections (
    id_connection INT NOT NULL AUTO_INCREMENT,
    id_etudiant INT NOT NULL,
    adresse_ip VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    heure_de_connection TIME NOT NULL,
    duree INT NULL,
    heure_de_deconnection TIME NULL,
    PRIMARY KEY (id_connection),
    FOREIGN KEY (id_etudiant) REFERENCES etudiants (id_etudiant)
);

-- Création de la table commandes
CREATE TABLE IF NOT EXISTS commandes (
    id_commande INT NOT NULL AUTO_INCREMENT,
    id_connection INT NOT NULL,
    date DATE NOT NULL,
    heure TIME NULL,
    commande VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_commande),
    FOREIGN KEY (id_connection) REFERENCES connections (id_connection)
);



-- Insertion des données dans la table etudiants
INSERT INTO etudiants (id_etudiant, nom, prenom, mention, note) VALUES
(40005638, 'Charlton', 'Wigelsworth', 'Yakitri', 28),
(40003388, 'Janaye', 'Thurston', 'Zoombox', 27),
(40003411, 'Shawnee', 'Trenbay', 'Meedoo', 23),
(40003611, 'Agustin', 'Joanaud', 'Realcube', 16),
(40005142, 'Charlean', 'Magill', 'Avavee', 12),
(40004048, 'Ebenezer', 'Cleiment', 'Gabcube', 10),
(40005583, 'Fidole', 'Klainman', 'Thoughtblab', 30),
(40003759, 'Alfie', 'Geggus', 'Katz', 9),
(40003834, 'Kaile', 'Laven', 'Aivee', 2),
(40003462, 'Reggie', 'Vreede', 'Skibox', 5),
(40003409, 'Liva', 'Coy', 'Browsecat', 4),
(40005156, 'Kaylyn', 'Crauford', 'Meejo', 28),
(40003980, 'Kimball', 'Du Pre', 'Blogpad', 3),
(40004378, 'Emeline', 'Downton', 'Eabox', 28),
(40004165, 'Noel', 'Cobello', 'Realblab', 17),
(40005270, 'Steven', 'Domenicone', 'Photobug', 28),
(40005194, 'Bordie', 'Balsellie', 'Tazz', 20),
(40005329, 'Cello', 'Harrison', 'Dynabox', 6),
(40004088, 'Nike', 'Kasparski', 'Rhybox', 9),
(40005472, 'Armand', 'Layne', 'Yabox', 13);



INSERT INTO connections (id_etudiant, adresse_ip, date, heure_de_connection, duree, heure_de_deconnection)
VALUES
(40005638, '192.168.1.1', '2024-01-01', '08:00:00', 60, '09:00:00'),
(40005638, '192.168.1.1', '2024-01-02', '10:30:00', 45, '11:15:00'),
(40005638, '192.168.1.1', '2024-01-03', '12:45:00', 30, '13:15:00'),
(40005638, '192.168.1.1', '2024-01-04', '14:30:00', 20, '14:50:00'),
(40005638, '192.168.1.1', '2024-01-05', '16:00:00', 15, '16:15:00'),
(40005638, '192.168.1.1', '2024-01-06', '18:00:00', 40, '18:40:00'),
(40005638, '192.168.1.1', '2024-01-07', '20:30:00', 25, '20:55:00'),

(40003388, '192.168.1.2', '2024-01-01', '09:00:00', 30, '09:30:00'),
(40003388, '192.168.1.2', '2024-01-02', '11:00:00', 45, '11:45:00'),
(40003388, '192.168.1.2', '2024-01-03', '13:00:00', 20, '13:20:00'),
(40003388, '192.168.1.2', '2024-01-04', '15:00:00', 35, '15:35:00'),
(40003388, '192.168.1.2', '2024-01-05', '17:30:00', 50, '18:20:00'),

(40003411, '192.168.1.3', '2024-02-01', '08:45:00', 40, '09:25:00'),
(40003411, '192.168.1.3', '2024-02-03', '11:15:00', 25, '11:40:00'),
(40003411, '192.168.1.3', '2024-02-05', '14:30:00', 60, '15:30:00'),
(40003411, '192.168.1.3', '2024-02-08', '17:00:00', 35, '17:35:00'),

(40003611, '192.168.1.4', '2024-02-02', '09:30:00', 20, '09:50:00'),
(40003611, '192.168.1.4', '2024-02-04', '12:15:00', 30, '12:45:00'),
(40003611, '192.168.1.4', '2024-02-06', '15:45:00', 40, '16:25:00'),

(40005142, '192.168.1.5', '2024-02-01', '08:30:00', 50, '09:20:00'),
(40005142, '192.168.1.5', '2024-02-03', '10:45:00', 15, '11:00:00'),
(40005142, '192.168.1.5', '2024-02-05', '13:00:00', 45, '13:45:00'),
(40005142, '192.168.1.5', '2024-02-08', '16:15:00', 30, '16:45:00'),
(40005142, '192.168.1.5', '2024-02-10', '18:45:00', 20, '19:05:00'),

(40004048, '192.168.1.6', '2024-02-02', '09:00:00', 25, '09:25:00'),
(40004048, '192.168.1.6', '2024-02-04', '11:30:00', 40, '12:10:00'),
(40004048, '192.168.1.6', '2024-02-06', '14:45:00', 20, '15:05:00'),

(40005583, '192.168.1.7', '2024-02-01', '08:15:00', 35, '08:50:00'),
(40005583, '192.168.1.7', '2024-02-03', '10:00:00', 60, '11:00:00'),
(40005583, '192.168.1.7', '2024-02-05', '13:30:00', 45, '14:15:00'),
(40005583, '192.168.1.7', '2024-02-08', '16:45:00', 30, '17:15:00'),
(40005583, '192.168.1.7', '2024-02-10', '18:30:00', 25, '18:55:00'),

(40003759, '192.168.1.8', '2024-02-02', '09:45:00', 30, '10:15:00'),
(40003759, '192.168.1.8', '2024-02-04', '12:00:00', 20, '12:20:00'),
(40003759, '192.168.1.8', '2024-02-06', '14:15:00', 40, '14:55:00'),

(40003834, '192.168.1.9', '2024-02-01', '08:00:00', 40, '08:40:00'),
(40003834, '192.168.1.9', '2024-02-03', '10:30:00', 25, '10:55:00'),
(40003834, '192.168.1.9', '2024-02-05', '13:45:00', 30, '14:15:00'),
(40003834, '192.168.1.9', '2024-02-08', '16:00:00', 15, '16:15:00'),
(40003834, '192.168.1.9', '2024-02-10', '18:30:00', 50, '19:20:00'),

(40003462, '192.168.1.10', '2024-02-02', '09:15:00', 30, '09:45:00'),
(40003462, '192.168.1.10', '2024-02-04', '11:45:00', 45, '12:30:00'),
(40003462, '192.168.1.10', '2024-02-06', '14:00:00', 20, '14:20:00'),

(40003409, '192.168.1.11', '2024-02-01', '08:30:00', 25, '08:55:00'),
(40003409, '192.168.1.11', '2024-02-03', '10:45:00', 40, '11:25:00'),
(40003409, '192.168.1.11', '2024-02-05', '13:00:00', 30, '13:30:00'),
(40003409, '192.168.1.11', '2024-02-08', '16:15:00', 20, '16:35:00'),
(40003409, '192.168.1.11', '2024-02-10', '18:45:00', 35, '19:20:00'),

(40005156, '192.168.1.12', '2024-02-02', '09:00:00', 40, '09:40:00'),
(40005156, '192.168.1.12', '2024-02-04', '11:30:00', 20, '11:50:00'),
(40005156, '192.168.1.12', '2024-02-06', '14:45:00', 30, '15:15:00'),
(40005156, '192.168.1.12', '2024-02-08', '17:00:00', 45, '17:45:00'),
(40005156, '192.168.1.12', '2024-02-10', '19:30:00', 15, '19:45:00'),

(40003980, '192.168.1.13', '2024-02-01', '08:45:00', 30, '09:15:00'),
(40003980, '192.168.1.13', '2024-02-03', '11:00:00', 25, '11:25:00'),
(40003980, '192.168.1.13', '2024-02-05', '13:30:00', 40, '14:10:00'),
(40003980, '192.168.1.13', '2024-02-08', '16:15:00', 20, '16:35:00'),
(40003980, '192.168.1.13', '2024-02-10', '18:30:00', 35, '19:05:00'),

(40004378, '192.168.1.14', '2024-02-02', '09:15:00', 45, '10:00:00'),
(40004378, '192.168.1.14', '2024-02-04', '11:45:00', 30, '12:15:00'),
(40004378, '192.168.1.14', '2024-02-06', '14:00:00', 20, '14:20:00'),

(40004165, '192.168.1.15', '2024-02-01', '08:30:00', 25, '08:55:00'),
(40004165, '192.168.1.15', '2024-02-03', '11:00:00', 40, '11:40:00'),
(40004165, '192.168.1.15', '2024-02-05', '13:30:00', 30, '14:00:00'),
(40004165, '192.168.1.15', '2024-02-08', '16:15:00', 20, '16:35:00'),
(40004165, '192.168.1.15', '2024-02-10', '18:45:00', 35, '19:20:00'),

(40005270, '192.168.1.16', '2024-02-02', '09:00:00', 40, '09:40:00'),
(40005270, '192.168.1.16', '2024-02-04', '11:30:00', 20, '11:50:00'),
(40005270, '192.168.1.16', '2024-02-06', '14:45:00', 30, '15:15:00'),
(40005270, '192.168.1.16', '2024-02-08', '17:00:00', 45, '17:45:00'),
(40005270, '192.168.1.16', '2024-02-10', '19:30:00', 15, '19:45:00'),

(40005194, '192.168.1.17', '2024-02-01', '08:45:00', 30, '09:15:00'),
(40005194, '192.168.1.17', '2024-02-03', '11:00:00', 45, '11:45:00'),
(40005194, '192.168.1.17', '2024-02-05', '13:30:00', 20, '13:50:00'),
(40005194, '192.168.1.17', '2024-02-08', '16:15:00', 25, '16:40:00'),
(40005194, '192.168.1.17', '2024-02-10', '18:45:00', 35, '19:20:00'),

(40005329, '192.168.1.18', '2024-02-02', '09:00:00', 40, '09:40:00'),
(40005329, '192.168.1.18', '2024-02-04', '11:30:00', 15, '11:45:00'),
(40005329, '192.168.1.18', '2024-02-06', '14:45:00', 30, '15:15:00'),
(40005329, '192.168.1.18', '2024-02-08', '17:00:00', 25, '17:25:00'),
(40005329, '192.168.1.18', '2024-02-10', '19:30:00', 20, '19:50:00'),

(40004088, '192.168.1.19', '2024-02-01', '08:30:00', 35, '09:05:00'),
(40004088, '192.168.1.19', '2024-02-03', '11:00:00', 20, '11:20:00'),
(40004088, '192.168.1.19', '2024-02-05', '13:30:00', 40, '14:10:00'),
(40004088, '192.168.1.19', '2024-02-08', '16:15:00', 25, '16:40:00'),
(40004088, '192.168.1.19', '2024-02-10', '18:45:00', 30, '19:15:00'),

(40005472, '192.168.1.20', '2024-02-02', '09:00:00', 40, '09:40:00'),
(40005472, '192.168.1.20', '2024-02-04', '11:30:00', 20, '11:50:00'),
(40005472, '192.168.1.20', '2024-02-06', '14:45:00', 30, '15:15:00'),
(40005472, '192.168.1.20', '2024-02-08', '17:00:00', 45, '17:45:00'),
(40005472, '192.168.1.20', '2024-02-10', '19:30:00', 15, '19:45:00');


-- Insertion des données dans la table commandes
-- Connexion 1
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(1, '2024-02-01', '08:30:00', 'ls -l'),
(1, '2024-02-01', '09:00:00', 'cat fichier.txt'),
(1, '2024-02-01', '10:00:00', 'mkdir dossier');

-- Connexion 2
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(2, '2024-02-03', '10:30:00', 'cd dossier'),
(2, '2024-02-03', '11:30:00', 'grep mot fichier.txt');

-- Connexion 3
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(3, '2024-02-05', '13:45:00', 'echo "Hello, World!"'),
(3, '2024-02-05', '14:00:00', 'chmod +x script.sh'),
(3, '2024-02-05', '15:00:00', './script.sh');

-- Connexion 4
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(4, '2024-02-08', '16:45:00', 'vim fichier.txt'),
(4, '2024-02-08', '17:00:00', 'grep -r motif dossier'),
(4, '2024-02-08', '17:30:00', 'rm fichier.txt');

-- Connexion 5
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(5, '2024-02-10', '18:30:00', 'mv fichier.txt dossier'),
(5, '2024-02-10', '19:00:00', 'ps aux | grep processus'),
(5, '2024-02-10', '19:30:00', 'tar -czvf archive.tar.gz dossier');

-- Exemple pour la connexion 6
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(6, '2024-02-01', '08:45:00', 'ls -al'),
(6, '2024-02-01', '09:15:00', 'cat fichier2.txt'),
(6, '2024-02-01', '10:30:00', 'mkdir dossier2');

-- Exemple pour la connexion 7
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(7, '2024-02-03', '10:45:00', 'cd dossier2'),
(7, '2024-02-03', '11:15:00', 'grep mot2 fichier2.txt');

-- Exemple pour la connexion 8
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(8, '2024-02-05', '13:15:00', 'echo "Bonjour, Monde!"'),
(8, '2024-02-05', '14:30:00', 'chmod +x script2.sh'),
(8, '2024-02-05', '15:45:00', './script2.sh');

-- Connexion 9
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(9, '2024-02-08', '16:00:00', 'vim fichier3.txt'),
(9, '2024-02-08', '16:30:00', 'grep -r motif2 dossier2'),
(9, '2024-02-08', '17:15:00', 'rm fichier3.txt');

-- Connexion 10
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(10, '2024-02-10', '18:15:00', 'mv fichier2.txt dossier2'),
(10, '2024-02-10', '19:00:00', 'ps aux | grep processus2'),
(10, '2024-02-10', '19:45:00', 'tar -czvf archive2.tar.gz dossier2');

-- Connexion 11
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(11, '2024-02-01', '08:15:00', 'ls -l'),
(11, '2024-02-01', '09:30:00', 'cat fichier4.txt'),
(11, '2024-02-01', '10:45:00', 'mkdir dossier3');

-- Connexion 12
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(12, '2024-02-03', '10:00:00', 'cd dossier3'),
(12, '2024-02-03', '11:15:00', 'grep mot3 fichier4.txt');

-- Connexion 13
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(13, '2024-02-05', '13:45:00', 'echo "Hola, Mundo!"'),
(13, '2024-02-05', '14:30:00', 'chmod +x script3.sh'),
(13, '2024-02-05', '15:15:00', './script3.sh');

-- Connexion 14
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(14, '2024-02-08', '16:30:00', 'vim fichier4.txt'),
(14, '2024-02-08', '17:15:00', 'grep -r motif3 dossier3'),
(14, '2024-02-08', '17:45:00', 'rm fichier4.txt');

-- Connexion 15
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(15, '2024-02-10', '18:45:00', 'mv fichier3.txt dossier3'),
(15, '2024-02-10', '19:30:00', 'ps aux | grep processus3'),
(15, '2024-02-10', '20:15:00', 'tar -czvf archive3.tar.gz dossier3');

-- Connexion 16
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(16, '2024-02-01', '08:30:00', 'ls -al'),
(16, '2024-02-01', '09:00:00', 'cat fichier5.txt'),
(16, '2024-02-01', '10:00:00', 'mkdir dossier4');

-- Connexion 17
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(17, '2024-02-03', '10:30:00', 'cd dossier4'),
(17, '2024-02-03', '11:30:00', 'grep mot4 fichier5.txt');

-- Connexion 18
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(18, '2024-02-05', '13:45:00', 'echo "Bonjour, Monde!"'),
(18, '2024-02-05', '14:00:00', 'chmod +x script4.sh'),
(18, '2024-02-05', '15:00:00', './script4.sh');

-- Connexion 19
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(19, '2024-02-08', '16:45:00', 'vim fichier5.txt'),
(19, '2024-02-08', '17:00:00', 'grep -r motif4 dossier4'),
(19, '2024-02-08', '17:30:00', 'rm fichier5.txt');

-- Connexion 20
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(20, '2024-02-10', '18:30:00', 'mv fichier4.txt dossier4'),
(20, '2024-02-10', '19:00:00', 'ps aux | grep processus4'),
(20, '2024-02-10', '19:30:00', 'tar -czvf archive4.tar.gz dossier4');

-- Connexion 21
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(21, '2024-02-01', '08:15:00', 'ls -l'),
(21, '2024-02-01', '09:30:00', 'cat fichier6.txt'),
(21, '2024-02-01', '10:45:00', 'mkdir dossier5');

-- Connexion 22
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(22, '2024-02-03', '10:00:00', 'cd dossier5'),
(22, '2024-02-03', '11:15:00', 'grep mot5 fichier6.txt');

-- Connexion 23
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(23, '2024-02-05', '13:45:00', 'echo "Hola, Mundo!"'),
(23, '2024-02-05', '14:30:00', 'chmod +x script5.sh'),
(23, '2024-02-05', '15:15:00', './script5.sh');

-- Connexion 24
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(24, '2024-02-08', '16:30:00', 'vim fichier6.txt'),
(24, '2024-02-08', '17:15:00', 'grep -r motif5 dossier5'),
(24, '2024-02-08', '17:45:00', 'rm fichier6.txt');

-- Connexion 25
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(25, '2024-02-10', '18:45:00', 'mv fichier5.txt dossier5'),
(25, '2024-02-10', '19:30:00', 'ps aux | grep processus5'),
(25, '2024-02-10', '20:15:00', 'tar -czvf archive5.tar.gz dossier5');

-- Connexions 26 à 45
-- Ajoutez autant de commandes que nécessaire en incrémentant le numéro de connexion

-- Connexion 26
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(26, '2024-02-01', '08:15:00', 'ls -l'),
(26, '2024-02-01', '09:30:00', 'cat fichier7.txt'),
(26, '2024-02-01', '10:45:00', 'mkdir dossier6');

-- Connexion 27
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(27, '2024-02-03', '10:00:00', 'cd dossier6'),
(27, '2024-02-03', '11:15:00', 'grep mot6 fichier7.txt');

-- Connexion 28
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(28, '2024-02-05', '13:45:00', 'echo "Hola, Mundo!"'),
(28, '2024-02-05', '14:30:00', 'chmod +x script6.sh'),
(28, '2024-02-05', '15:15:00', './script6.sh');

-- Connexion 29
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(29, '2024-02-08', '16:30:00', 'vim fichier7.txt'),
(29, '2024-02-08', '17:15:00', 'grep -r motif6 dossier6'),
(29, '2024-02-08', '17:45:00', 'rm fichier7.txt');

-- Connexion 30
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(30, '2024-02-10', '18:45:00', 'mv fichier6.txt dossier6'),
(30, '2024-02-10', '19:30:00', 'ps aux | grep processus6'),
(30, '2024-02-10', '20:15:00', 'tar -czvf archive6.tar.gz dossier6');

-- Connexion 31
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(31, '2024-02-15', '08:00:00', 'ls -l'),
(31, '2024-02-15', '09:15:00', 'cat fichier8.txt'),
(31, '2024-02-15', '10:30:00', 'mkdir dossier7');

-- Connexion 32
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(32, '2024-02-17', '10:45:00', 'cd dossier7'),
(32, '2024-02-17', '11:30:00', 'grep mot7 fichier8.txt');

-- Connexion 33
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(33, '2024-02-19', '13:00:00', 'echo "Bonjour, Monde!"'),
(33, '2024-02-19', '14:15:00', 'chmod +x script7.sh'),
(33, '2024-02-19', '15:30:00', './script7.sh');

-- Connexion 34
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(34, '2024-02-22', '16:00:00', 'vim fichier8.txt'),
(34, '2024-02-22', '17:15:00', 'grep -r motif7 dossier7'),
(34, '2024-02-22', '17:45:00', 'rm fichier8.txt');

-- Connexion 35
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(35, '2024-02-25', '18:30:00', 'mv fichier7.txt dossier7'),
(35, '2024-02-25', '19:00:00', 'ps aux | grep processus7'),
(35, '2024-02-25', '19:30:00', 'tar -czvf archive7.tar.gz dossier7');

-- Connexion 36
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(36, '2024-02-29', '08:45:00', 'ls -l'),
(36, '2024-02-29', '09:30:00', 'cat fichier9.txt'),
(36, '2024-02-29', '10:45:00', 'mkdir dossier8');

-- Connexion 37
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(37, '2024-03-02', '10:00:00', 'cd dossier8'),
(37, '2024-03-02', '11:15:00', 'grep mot8 fichier9.txt');

-- Connexion 38
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(38, '2024-03-04', '13:45:00', 'echo "Hola, Mundo!"'),
(38, '2024-03-04', '14:30:00', 'chmod +x script8.sh'),
(38, '2024-03-04', '15:15:00', './script8.sh');

-- Connexion 39
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(39, '2024-03-07', '16:30:00', 'vim fichier9.txt'),
(39, '2024-03-07', '17:15:00', 'grep -r motif8 dossier8'),
(39, '2024-03-07', '17:45:00', 'rm fichier9.txt');

-- Connexions 40 à 60
-- Ajoutez autant de commandes que nécessaire en incrémentant le numéro de connexion

-- Connexion 40
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(40, '2024-03-10', '18:45:00', 'mv fichier8.txt dossier8'),
(40, '2024-03-10', '19:30:00', 'ps aux | grep processus8'),
(40, '2024-03-10', '20:15:00', 'tar -czvf archive8.tar.gz dossier8'),
(40, '2024-03-10', '21:00:00', 'echo "Goodbye!"');

-- Connexion 41
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(41, '2024-03-15', '08:00:00', 'ls -l'),
(41, '2024-03-15', '09:15:00', 'cat fichier10.txt'),
(41, '2024-03-15', '10:30:00', 'mkdir dossier9'),
(41, '2024-03-15', '11:30:00', 'echo "Bonjour, Monde!"');

-- Connexion 42
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(42, '2024-03-17', '10:45:00', 'cd dossier9'),
(42, '2024-03-17', '11:30:00', 'grep mot9 fichier10.txt'),
(42, '2024-03-17', '12:15:00', 'echo "Hola, Mundo!"');

-- Connexion 43
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(43, '2024-03-19', '13:00:00', 'chmod +x script9.sh'),
(43, '2024-03-19', '14:15:00', './script9.sh'),
(43, '2024-03-19', '15:30:00', 'echo "Ciao, Mondo!"');

-- Connexion 44
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(44, '2024-03-22', '16:00:00', 'vim fichier10.txt'),
(44, '2024-03-22', '17:15:00', 'grep -r motif9 dossier9'),
(44, '2024-03-22', '17:45:00', 'rm fichier10.txt'),
(44, '2024-03-22', '18:30:00', 'echo "Hallo, Welt!"');

-- Connexion 45
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(45, '2024-03-25', '18:45:00', 'mv fichier9.txt dossier9'),
(45, '2024-03-25', '19:30:00', 'ps aux | grep processus9'),
(45, '2024-03-25', '20:15:00', 'tar -czvf archive9.tar.gz dossier9'),
(45, '2024-03-25', '21:00:00', 'echo "Auf Wiedersehen!"');

-- Connexion 46
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(46, '2024-03-29', '08:15:00', 'ls -l'),
(46, '2024-03-29', '09:30:00', 'cat fichier11.txt'),
(46, '2024-03-29', '10:45:00', 'mkdir dossier10'),
(46, '2024-03-29', '11:45:00', 'echo "Bonjour, le Monde!"');

-- Connexion 47
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(47, '2024-04-01', '10:00:00', 'cd dossier10'),
(47, '2024-04-01', '11:15:00', 'grep mot10 fichier11.txt'),
(47, '2024-04-01', '12:00:00', 'echo "Hola, el Mundo!"');

-- Connexion 48
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(48, '2024-04-03', '13:45:00', 'chmod +x script10.sh'),
(48, '2024-04-03', '14:30:00', './script10.sh'),
(48, '2024-04-03', '15:45:00', 'echo "Hallo, die Welt!"');

-- Connexion 49
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(49, '2024-04-06', '16:30:00', 'vim fichier11.txt'),
(49, '2024-04-06', '17:15:00', 'grep -r motif10 dossier10'),
(49, '2024-04-06', '17:45:00', 'rm fichier11.txt'),
(49, '2024-04-06', '18:30:00', 'echo "Ciao, il Mondo!"');

-- Connexion 50
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(50, '2024-04-09', '18:45:00', 'mv fichier10.txt dossier10'),
(50, '2024-04-09', '19:30:00', 'ps aux | grep processus10'),
(50, '2024-04-09', '20:15:00', 'tar -czvf archive10.tar.gz dossier10'),
(50, '2024-04-09', '21:00:00', 'echo "Arrivederci!"');

-- Connexion 51
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(51, '2024-04-12', '08:00:00', 'ls -l'),
(51, '2024-04-12', '09:15:00', 'cat fichier12.txt'),
(51, '2024-04-12', '10:30:00', 'mkdir dossier11'),
(51, '2024-04-12', '11:30:00', 'echo "Hello, World!"');

-- Connexion 52
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(52, '2024-04-15', '10:45:00', 'cd dossier11'),
(52, '2024-04-15', '11:30:00', 'grep mot11 fichier12.txt'),
(52, '2024-04-15', '12:15:00', 'echo "Bonjour, Monde!"');

-- Connexion 53
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(53, '2024-04-17', '13:00:00', 'chmod +x script11.sh'),
(53, '2024-04-17', '14:15:00', './script11.sh'),
(53, '2024-04-17', '15:30:00', 'echo "Ciao, Mondo!"');

-- Connexion 54
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(54, '2024-04-20', '16:00:00', 'vim fichier12.txt'),
(54, '2024-04-20', '17:15:00', 'grep -r motif11 dossier11'),
(54, '2024-04-20', '17:45:00', 'rm fichier12.txt'),
(54, '2024-04-20', '18:30:00', 'echo "Hallo, Welt!"');

-- Connexion 55
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(55, '2024-04-23', '18:45:00', 'mv fichier11.txt dossier11'),
(55, '2024-04-23', '19:30:00', 'ps aux | grep processus11'),
(55, '2024-04-23', '20:15:00', 'tar -czvf archive11.tar.gz dossier11'),
(55, '2024-04-23', '21:00:00', 'echo "Auf Wiedersehen!"');

-- Connexion 56
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(56, '2024-04-27', '08:15:00', 'ls -l'),
(56, '2024-04-27', '09:30:00', 'cat fichier13.txt'),
(56, '2024-04-27', '10:45:00', 'mkdir dossier12'),
(56, '2024-04-27', '11:45:00', 'echo "Bonjour, le Monde!"');

-- Connexion 57
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(57, '2024-04-30', '10:00:00', 'cd dossier12'),
(57, '2024-04-30', '11:15:00', 'grep mot12 fichier13.txt'),
(57, '2024-04-30', '12:00:00', 'echo "Hola, el Mundo!"');

-- Connexion 58
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(58, '2024-05-02', '13:45:00', 'chmod +x script12.sh'),
(58, '2024-05-02', '14:30:00', './script12.sh'),
(58, '2024-05-02', '15:45:00', 'echo "Hallo, die Welt!"');

-- Connexion 59
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(59, '2024-05-05', '16:30:00', 'vim fichier13.txt'),
(59, '2024-05-05', '17:15:00', 'grep -r motif12 dossier12'),
(59, '2024-05-05', '17:45:00', 'rm fichier13.txt'),
(59, '2024-05-05', '18:30:00', 'echo "Ciao, il Mondo!"');

-- Connexion 60
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(60, '2024-05-08', '18:45:00', 'mv fichier12.txt dossier12'),
(60, '2024-05-08', '19:30:00', 'ps aux | grep processus12'),
(60, '2024-05-08', '20:15:00', 'tar -czvf archive12.tar.gz dossier12'),
(60, '2024-05-08', '21:00:00', 'echo "Arrivederci!"');

-- Connexion 61
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(61, '2024-05-12', '08:00:00', 'ls -l'),
(61, '2024-05-12', '09:15:00', 'cat fichier14.txt'),
(61, '2024-05-12', '10:30:00', 'mkdir dossier13'),
(61, '2024-05-12', '11:30:00', 'echo "Hello, World!"');

-- Connexion 62
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(62, '2024-05-15', '10:45:00', 'cd dossier13'),
(62, '2024-05-15', '11:30:00', 'grep mot13 fichier14.txt'),
(62, '2024-05-15', '12:15:00', 'echo "Bonjour, Monde!"');

-- Connexion 63
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(63, '2024-05-17', '13:00:00', 'chmod +x script13.sh'),
(63, '2024-05-17', '14:15:00', './script13.sh'),
(63, '2024-05-17', '15:30:00', 'echo "Ciao, Mondo!"');

-- Connexion 64
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(64, '2024-05-20', '16:00:00', 'vim fichier14.txt'),
(64, '2024-05-20', '17:15:00', 'grep -r motif13 dossier13'),
(64, '2024-05-20', '17:45:00', 'rm fichier14.txt'),
(64, '2024-05-20', '18:30:00', 'echo "Hallo, Welt!"');

-- Connexion 65
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(65, '2024-05-23', '18:45:00', 'mv fichier13.txt dossier13'),
(65, '2024-05-23', '19:30:00', 'ps aux | grep processus13'),
(65, '2024-05-23', '20:15:00', 'tar -czvf archive13.tar.gz dossier13'),
(65, '2024-05-23', '21:00:00', 'echo "Auf Wiedersehen!"');

-- Connexion 66
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(66, '2024-05-27', '08:15:00', 'ls -l'),
(66, '2024-05-27', '09:30:00', 'cat fichier15.txt'),
(66, '2024-05-27', '10:45:00', 'mkdir dossier14'),
(66, '2024-05-27', '11:45:00', 'echo "Bonjour, le Monde!"');

-- Connexion 67
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(67, '2024-05-30', '10:00:00', 'cd dossier14'),
(67, '2024-05-30', '11:15:00', 'grep mot14 fichier15.txt'),
(67, '2024-05-30', '12:00:00', 'echo "Hola, el Mundo!"');

-- Connexion 68
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(68, '2024-06-01', '13:45:00', 'chmod +x script14.sh'),
(68, '2024-06-01', '14:30:00', './script14.sh'),
(68, '2024-06-01', '15:45:00', 'echo "Hallo, die Welt!"');


-- Connexions 69 à 83
-- Ajoutez autant de commandes que nécessaire en incrémentant le numéro de connexion

-- Connexion 69
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(69, '2024-05-15', '08:00:00', 'ls -l'),
(69, '2024-05-15', '09:15:00', 'cat fichier21.txt'),
(69, '2024-05-15', '10:30:00', 'mkdir dossier20'),
(69, '2024-05-15', '11:30:00', 'echo "Hello, World!"');

-- Connexion 70
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(70, '2024-05-17', '10:45:00', 'cd dossier20'),
(70, '2024-05-17', '11:30:00', 'grep mot20 fichier21.txt'),
(70, '2024-05-17', '12:15:00', 'echo "Bonjour, le Monde!"');

-- Connexion 71
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(71, '2024-05-19', '13:00:00', 'chmod +x script20.sh'),
(71, '2024-05-19', '14:15:00', './script20.sh'),
(71, '2024-05-19', '15:30:00', 'echo "Hola, el Mundo!"');

-- Connexion 72
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(72, '2024-05-22', '16:00:00', 'vim fichier22.txt'),
(72, '2024-05-22', '17:15:00', 'grep -r motif20 dossier20'),
(72, '2024-05-22', '17:45:00', 'rm fichier22.txt'),
(72, '2024-05-22', '18:30:00', 'echo "Ciao, il Mondo!"');

-- Connexion 73
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(73, '2024-05-25', '18:45:00', 'mv fichier21.txt dossier21'),
(73, '2024-05-25', '19:30:00', 'ps aux | grep processus21'),
(73, '2024-05-25', '20:15:00', 'tar -czvf archive21.tar.gz dossier21'),
(73, '2024-05-25', '21:00:00', 'echo "Auf Wiedersehen!"');

-- Connexion 74
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(74, '2024-05-29', '08:15:00', 'ls -l'),
(74, '2024-05-29', '09:30:00', 'cat fichier23.txt'),
(74, '2024-05-29', '10:45:00', 'mkdir dossier22'),
(74, '2024-05-29', '11:45:00', 'echo "Bonjour, le Monde!"');

-- Connexion 75
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(75, '2024-06-01', '10:00:00', 'cd dossier22'),
(75, '2024-06-01', '11:15:00', 'grep mot22 fichier23.txt'),
(75, '2024-06-01', '12:00:00', 'echo "Hola, el Mundo!"');

-- Connexion 76
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(76, '2024-06-03', '13:45:00', 'chmod +x script22.sh'),
(76, '2024-06-03', '14:30:00', './script22.sh'),
(76, '2024-06-03', '15:45:00', 'echo "Hallo, die Welt!"');

-- Connexion 77
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(77, '2024-06-06', '16:30:00', 'vim fichier24.txt'),
(77, '2024-06-06', '17:15:00', 'grep -r motif22 dossier22'),
(77, '2024-06-06', '17:45:00', 'rm fichier24.txt'),
(77, '2024-06-06', '18:30:00', 'echo "Ciao, il Mondo!"');

-- Connexion 78
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(78, '2024-06-09', '18:45:00', 'mv fichier23.txt dossier23'),
(78, '2024-06-09', '19:30:00', 'ps aux | grep processus23'),
(78, '2024-06-09', '20:15:00', 'tar -czvf archive23.tar.gz dossier23'),
(78, '2024-06-09', '21:00:00', 'echo "Arrivederci!"');

-- Connexion 79
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(79, '2024-06-12', '08:00:00', 'ls -l'),
(79, '2024-06-12', '09:15:00', 'cat fichier25.txt'),
(79, '2024-06-12', '10:30:00', 'mkdir dossier24'),
(79, '2024-06-12', '11:30:00', 'echo "Bonjour, le Monde!"');

-- Connexion 80
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(80, '2024-06-14', '10:45:00', 'cd dossier24'),
(80, '2024-06-14', '11:30:00', 'grep mot24 fichier25.txt'),
(80, '2024-06-14', '12:15:00', 'echo "Hola, el Mundo!"');

-- Connexion 81
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(81, '2024-06-16', '13:00:00', 'chmod +x script24.sh'),
(81, '2024-06-16', '14:15:00', './script24.sh'),
(81, '2024-06-16', '15:30:00', 'echo "Hola, el Mundo!"');

-- Connexion 82
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(82, '2024-06-19', '16:00:00', 'vim fichier26.txt'),
(82, '2024-06-19', '17:15:00', 'grep -r motif24 dossier24'),
(82, '2024-06-19', '17:45:00', 'rm fichier26.txt'),
(82, '2024-06-19', '18:30:00', 'echo "Ciao, il Mondo!"');

-- Connexion 83
INSERT INTO commandes (id_connection, date, heure, commande)
VALUES
(83, '2024-06-22', '18:45:00', 'mv fichier25.txt dossier25'),
(83, '2024-06-22', '19:30:00', 'ps aux | grep processus25'),
(83, '2024-06-22', '20:15:00', 'tar -czvf archive25.tar.gz dossier25'),
(83, '2024-06-22', '21:00:00', 'echo "Arrivederci!"');

