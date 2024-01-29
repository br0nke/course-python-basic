INSERT INTO clients (first_name, last_name, email, phone)
VALUES ("Dzimas", "Sruikolkas", "dzimeris12@one.lt", "+37062438434");
INSERT INTO clients (first_name, last_name, email, phone)
VALUES ("Sloikas", "Raugas", "raugintas@one.lt", "+370872537823");

SELECT * FROM clients;
SELECT * FROM clients WHERE id = 1;
SELECT id, first_name, last_name FROM clients;
SELECT first_name || " " || last_name AS full_name FROM clients;
SELECT * FROM clients WHERE email LIKE "%@one%";
