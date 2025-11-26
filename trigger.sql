--TRIGGERS : CALCUL DES MONTANTS AVANT INSERT / UPDATE
DELIMITER $$

-- Calcul montant_mo AVANT INSERT
CREATE TRIGGER trg_or_calc_mo_before_ins
BEFORE INSERT ON g_ordre_reparation
FOR EACH ROW
BEGIN
    DECLARE mo_tarif DECIMAL(10, 2);

    -- Recup tarif horaire dans g_main_doeuvre
    SELECT mo_tarif_horaire
    INTO mo_tarif
    FROM g_main_doeuvre
    WHERE mo_id = NEW.or_fk_or_g_main_doeuvre_id;

    -- nb heures * tarif horaire
    SET NEW.or_montant_mo = NEW.or_main_doeuvre_qty * mo_tarif;
END $$

-- Calcul montant_mo AVANT UPDATE
CREATE TRIGGER trg_or_calc_mo_before_upd
BEFORE UPDATE ON g_ordre_reparation
FOR EACH ROW
BEGIN
    DECLARE mo_tarif DECIMAL(10, 2);

    SELECT mo_tarif_horaire
    INTO mo_tarif
    FROM g_main_doeuvre
    WHERE mo_id = NEW.or_fk_or_g_main_doeuvre_id;

    SET NEW.or_montant_mo = NEW.or_main_doeuvre_qty * mo_tarif;
END $$

-- Calcul montant_a AVANT INSERT
CREATE TRIGGER trg_ora_calc_montant_before_ins
BEFORE INSERT ON g_ordre_reparation_article
FOR EACH ROW
BEGIN
    DECLARE article_prix DECIMAL(10, 2);

    -- Recup prix article
    SELECT a_prix
    INTO article_prix
    FROM g_article
    WHERE a_id = NEW.ora_fk_ora_article_id;

    -- quantité * prix unitaire
    SET NEW.ora_montant_a = NEW.ora_qty * article_prix;
END $$

-- Calcul montant_a AVANT UPDATE
CREATE TRIGGER trg_ora_calc_montant_before_upd
BEFORE UPDATE ON g_ordre_reparation_article
FOR EACH ROW
BEGIN
    DECLARE article_prix DECIMAL(10, 2);

    SELECT a_prix
    INTO article_prix
    FROM g_article
    WHERE a_id = NEW.ora_fk_ora_article_id;

    SET NEW.ora_montant_a = NEW.ora_qty * article_prix;
END $$

DELIMITER ;

-- DROP ancien trigger
DROP TRIGGER IF EXISTS trg_ora_calc_montant_before_ins;

DELIMITER $$

CREATE TRIGGER trg_ora_calc_montant_before_ins
BEFORE INSERT ON g_ordre_reparation_article
FOR EACH ROW
BEGIN
    DECLARE article_prix DECIMAL(10,2);  -- prix unitaire
    DECLARE stock_actuel INT;            -- stock disponible

    -- Recup prix & stock
    SELECT a_prix, a_qty
    INTO article_prix, stock_actuel
    FROM g_article
    WHERE a_id = NEW.ora_fk_ora_article_id;

    -- Verif stock
    IF stock_actuel < NEW.ora_qty THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stock insuffisant';
    END IF;

    -- Déduire article stock
    UPDATE g_article
    SET a_qty = a_qty - NEW.ora_qty
    WHERE a_id = NEW.ora_fk_ora_article_id;

    -- Calcul montant_a
    SET NEW.ora_montant_a = NEW.ora_qty * article_prix;
END $$

DELIMITER ;


