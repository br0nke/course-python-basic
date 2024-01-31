--insertai
INSERT INTO produktai (id, pavadinimas, kaina)
VALUES (1, "Ausines GHF2", 149.99),
    (2, "Siurblys", 389.39),
    (3, "Virdulys", 29.89),
    (4, "Draudimas", 89.00),
    (5, "Nario mokestis", 5.99),
    (6, "Pjuklas", 15);

INSERT INTO pirkejas (id, vardas, pavarde)
VALUES (1, "Grik", "Buler"),
    (2, "Roba", "Shweide"),
    (3, "Kolme", "Britou"),
    (4, "Zikarat", "Dob");

INSERT INTO saskaita (id, pirkimo_data, kasininko_id, pirkejo_id)
VALUES (1, "2022-12-21", 2, 1),
    (2, "2023-06-13", 1, 2),
    (3, "2023-08-21", 3, 2),
    (4, "2024-01-14", 1, 3),
    (5, "2024-01-15", 1, 2),
    (6, "2024-01-15", 2, 4);

INSERT INTO saskaitos_eilute (id, saskaitos_id, produktu_id, kiekis)
VALUES (1, 1, 1, 1),
    (2, 2, 5, 1),
    (3, 3, 3, 2),
    (4, 4, 2, 1),
    (5, 5, 4, 1),
    (6, 6, 5, 1);

SELECT saskaita.id, produktai.pavadinimas, pirkimo_data, produktai.kaina, produktai.kaina * kiekis
    FROM saskaitos_eilute
    JOIN saskaita ON saskaitos_id = saskaita.id
    JOIN produktai ON produktu_id = produktai.id;