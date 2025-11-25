CREATE TABLE
    IF NOT EXISTS g_article (
        a_id int NOT NULL AUTO_INCREMENT,
        a_ref varchar(50),
        a_qty int,
        a_designation varchar(50),
        a_marque varchar(25),
        PRIMARY KEY (a_id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    IF NOT EXISTS g_vehicule (
        v_id int NOT NULL AUTO_INCREMENT,
        v_type VARCHAR(50),
        v_energie VARCHAR(50),
        v_marque VARCHAR(50),
        PRIMARY KEY (v_id),
        v_fk_article_vehicule_id int NOT NULL,
        FOREIGN KEY (v_fk_article_vehicule_id) REFERENCES g_article (a_id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

INSERT INTO
    g_article (a_designation, a_marque, a_qty, a_ref)
VALUES
    ('filtre à air', 'VALEO', 10, '7DJH423');

INSERT INTO
    g_article (a_designation, a_marque, a_qty, a_ref)
VALUES
    ('filtre à GO', 'MECAFILTER', 25, '5SQGD5Z');

INSERT INTO
    g_article (a_designation, a_marque, a_qty, a_ref)
VALUES
    ('filtre à pollen', 'BOSCH', 22, '7DJT423');

INSERT INTO
    g_article (a_designation, a_marque, a_qty, a_ref)
VALUES
    ('filtre à huile', 'MAN FILTER', 9, 'RDTH123');

INSERT INTO
    g_article (a_designation, a_marque, a_qty, a_ref)
VALUES
    ('filtre à air', 'BOSCH', 2, 'JKD7HP2');

INSERT INTO
    g_article (a_designation, a_marque, a_qty, a_ref)
VALUES
    ('filtre à POLLEN', 'VALEO', 10, 'IPDT5HGS');

INSERT INTO
    g_vehicule (
        v_energie,
        v_marque,
        v_type,
        v_fk_article_vehicule_id
    )
VALUES
    ('ESSENCE', 'FIAT', '500', 3);

INSERT INTO
    g_vehicule (
        v_energie,
        v_marque,
        v_type,
        v_fk_article_vehicule_id
    )
VALUES
    ('DIESEL', 'TOYOTA', 'YARIS', 2);

INSERT INTO
    g_vehicule (
        v_energie,
        v_marque,
        v_type,
        v_fk_article_vehicule_id
    )
VALUES
    ('ESSENCE', 'PEUGEOT', '208', 4);

INSERT INTO
    g_vehicule (
        v_energie,
        v_marque,
        v_type,
        v_fk_article_vehicule_id
    )
VALUES
    ('ESSENCE', 'RENAULT', 'MEGANE', 4);

INSERT INTO
    g_vehicule (
        v_energie,
        v_marque,
        v_type,
        v_fk_article_vehicule_id
    )
VALUES
    ('DIESEL', 'CITROEN', 'C3', 5);