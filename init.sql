-- Jeu de donnees initial du projet : 8 stations, 4 quartiers.
-- Ce script n'est joue qu'a la PREMIERE initialisation du stockage
-- de la base de donnees. Souviens-toi de ce detail, il fait perdre
-- vingt minutes a une salle entiere chaque annee.

CREATE TABLE stations (
    nom               TEXT PRIMARY KEY,
    quartier          TEXT NOT NULL,
    velos_disponibles INTEGER NOT NULL,
    capacite          INTEGER NOT NULL
);

INSERT INTO stations (nom, quartier, velos_disponibles, capacite) VALUES
    ('Gare Centrale',      'Centre', 12, 20),
    ('Place du Marche',    'Centre',  2, 15),
    ('Hotel de Ville',     'Centre',  9, 18),
    ('Parc des Sports',    'Nord',    7, 10),
    ('College Jean Moulin','Nord',    0, 12),
    ('Universite',         'Sud',     1, 25),
    ('Piscine Olympique',  'Sud',    14, 16),
    ('Zone Industrielle',  'Ouest',   5, 10);
