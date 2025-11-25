CREATE TABLE
    IF NOT EXISTS g_article (
        a_id int NOT NULL AUTO_INCREMENT,
        a_ref varchar(50),
        a_qty int,
        a_designation varchar(50),
        a_marque varchar(25),
        PRIMARY KEY a_id
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