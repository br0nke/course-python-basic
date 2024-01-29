INSERT INTO mokytojai (id, vardas, pavarde, specialybe, patirtis_metais)
VALUES (1, "Petras", "Petraitis", "Matematika", "2013");
INSERT INTO mokytojai (id, vardas, pavarde, specialybe, patirtis_metais)
VALUES (2, "Ona", "Onaite", "Fizika", "2012");
INSERT INTO mokytojai (id, vardas, pavarde, specialybe, patirtis_metais)
VALUES (3, "Marius", "Marijus", "Biologija", "2015");
INSERT INTO mokytojai (id, vardas, pavarde, specialybe, patirtis_metais)
VALUES (4, "Rasa", "Rasaite", "Anglu kalba", "2011");
INSERT INTO mokytojai (id, vardas, pavarde, specialybe, patirtis_metais)
VALUES (5, "Aurimas", "Aurimaitis", "Lietuviu kalba", "2018");
INSERT INTO mokytojai (id, vardas, pavarde, specialybe, patirtis_metais)
VALUES (6, "Gintare", "Gintarele", "Istorija", "2020");

SELECT * FROM mokytojai;
--3
SELECT * FROM mokytojai WHERE specialybe = "Matematika";
--4
SELECT vardas, pavarde, specialybe FROM mokytojai WHERE (2024 - patirtis_metais) > 8 or (2024 - patirtis_metais) > 9;

--5
UPDATE mokytojai SET pavarde = "Zoliene" WHERE pavarde = "Rasaite";
--6
DELETE FROM mokytojai WHERE id = 4;