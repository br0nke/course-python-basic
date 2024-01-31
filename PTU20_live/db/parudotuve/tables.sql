--products
CREATE TABLE produktai (
    id INTEGER PRIMARY KEY,
    pavadinimas VARCHAR(50),
    kaina DECIMAL(5, 2)
);

CREATE TABLE pirkejas (
    id INTEGER PRIMARY KEY,
    vardas VARCHAR(20),
    pavarde VARCHAR(20)
);

CREATE TABLE saskaita (
    id INTEGER PRIMARY KEY,
    pirkimo_data DATE,
    kasininko_id INT(1),
    pirkejo_id INTEGER REFERENCES pirkejas (id)
);

CREATE TABLE saskaitos_eilute (
    id INTEGER PRIMARY KEY,
    saskaitos_id INTEGER REFERENCES saskaita (id),
    produktu_id INTEGER REFERENCES produktai (id),
    kiekis INT
);

DROP TABLE saskaita;