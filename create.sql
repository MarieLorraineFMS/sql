-- Table des pièces mécaniques (stock de pièces)
CREATE TABLE
    IF NOT EXISTS g_article (
        a_id INT NOT NULL AUTO_INCREMENT,
        a_ref VARCHAR(50),
        a_qty INT,
        a_designation VARCHAR(50),
        a_marque VARCHAR(25),
        a_prix DECIMAL(10, 2), -- prix unitaire
        PRIMARY KEY (a_id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- Table des véhicules (catalogue : modèle / énergie / marque)
CREATE TABLE
    IF NOT EXISTS g_vehicule (
        v_id INT NOT NULL AUTO_INCREMENT,
        v_type VARCHAR(50),
        v_energie VARCHAR(50),
        v_marque VARCHAR(50),
        PRIMARY KEY (v_id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- Table des clients
CREATE TABLE
    IF NOT EXISTS g_client (
        c_id INT NOT NULL AUTO_INCREMENT,
        c_nom VARCHAR(50),
        c_adresse VARCHAR(100),
        c_telephone VARCHAR(15),
        PRIMARY KEY (c_id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- Table de liaison entre client & un véhicule (plaque / année)
CREATE TABLE
    IF NOT EXISTS g_vehicule_client (
        vc_id INT NOT NULL AUTO_INCREMENT,
        vc_plaque VARCHAR(15),
        vc_annee INT (4),
        vc_fk_catalogue_vehicule_id INT NOT NULL, -- FK vers catalogue (g_vehicule)
        vc_fk_client_vehicule_id INT NOT NULL, -- FK vers client (g_client)
        PRIMARY KEY (vc_id),
        FOREIGN KEY (vc_fk_catalogue_vehicule_id) REFERENCES g_vehicule (v_id),
        FOREIGN KEY (vc_fk_client_vehicule_id) REFERENCES g_client (c_id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- Table param main d'oeuvre(tarif horaire)
CREATE TABLE
    IF NOT EXISTS g_main_doeuvre (
        mo_id INT NOT NULL AUTO_INCREMENT,
        mo_tarif_horaire DECIMAL(5, 2),
        PRIMARY KEY (mo_id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- Table des ordres de réparation (OR)
CREATE TABLE
    IF NOT EXISTS g_ordre_reparation (
        or_id INT NOT NULL AUTO_INCREMENT,
        or_main_doeuvre_qty DECIMAL(5, 2) DEFAULT NULL, -- nb d'heures
        or_montant_mo DECIMAL(10, 2) DEFAULT NULL, -- montant MO
        or_fk_or_vclient_id INT NOT NULL, -- FK g_vehicule_client
        or_fk_or_g_main_doeuvre_id INT NOT NULL, -- FK g_main_doeuvre
        PRIMARY KEY (or_id),
        KEY or_fk_or_vclient_id (or_fk_or_vclient_id),
        KEY or_fk_or_g_main_doeuvre_id (or_fk_or_g_main_doeuvre_id),
        CONSTRAINT g_ordre_reparation_ibfk_1 FOREIGN KEY (or_fk_or_vclient_id) REFERENCES g_vehicule_client (vc_id),
        CONSTRAINT fk_or_main_doeuvre FOREIGN KEY (or_fk_or_g_main_doeuvre_id) REFERENCES g_main_doeuvre (mo_id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- Table des articles utilisées dans un OR
CREATE TABLE
    IF NOT EXISTS g_ordre_reparation_article (
        ora_id INT NOT NULL AUTO_INCREMENT,
        ora_qty DECIMAL(5, 2),
        ora_montant_a DECIMAL(10, 2), -- montant
        ora_fk_ora_article_id INT NOT NULL, -- FK vers g_article
        ora_fk_ora_or_id INT NOT NULL, -- FK vers g_ordre_reparation
        PRIMARY KEY (ora_id),
        FOREIGN KEY (ora_fk_ora_article_id) REFERENCES g_article (a_id),
        FOREIGN KEY (ora_fk_ora_or_id) REFERENCES g_ordre_reparation (or_id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- Table de liaison véhicule / articles
CREATE TABLE
    IF NOT EXISTS g_vehicule_article (
        va_id INT NOT NULL AUTO_INCREMENT,
        va_fk_vehicule_id INT NOT NULL, -- FK vers g_vehicule
        va_fk_article_id INT NOT NULL, -- FK vers g_article
        PRIMARY KEY (va_id),
        CONSTRAINT fk_va_vehicule FOREIGN KEY (va_fk_vehicule_id) REFERENCES g_vehicule (v_id) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_va_article FOREIGN KEY (va_fk_article_id) REFERENCES g_article (a_id) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT uq_va UNIQUE (va_fk_vehicule_id, va_fk_article_id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- Table des factures liées à un OR
CREATE TABLE
    IF NOT EXISTS g_facture (
        f_id INT NOT NULL AUTO_INCREMENT,
        f_numero VARCHAR(30) NOT NULL, -- numéro de facture
        f_date DATE NOT NULL, -- date de facture
        f_fk_or_id INT NOT NULL, -- FK vers g_ordre_reparation
        f_total_mo DECIMAL(10, 2) NOT NULL, -- total main d'œuvre
        f_total_articles DECIMAL(10, 2) NOT NULL, -- total pièces
        f_total_ttc DECIMAL(10, 2) NOT NULL, -- total global
        PRIMARY KEY (f_id),
        UNIQUE KEY uq_facture_numero (f_numero),
        CONSTRAINT fk_facture_or FOREIGN KEY (f_fk_or_id) REFERENCES g_ordre_reparation (or_id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;