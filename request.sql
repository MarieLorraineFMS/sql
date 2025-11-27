-- SELECT Client / véhicule / OR & articles associés pour une plaque donnée
-- 1 ligne = 1 ORA client / véhicule / OR / article
SELECT
    c_nom,
    c_adresse,
    c_telephone,
    vc_plaque,
    vc_annee,
    v_marque,
    v_type,
    v_energie,
    or_id,
    or_main_doeuvre_qty,
    or_montant_mo,
    a_ref,
    a_designation,
    a_prix,
    ora_qty,
    ora_montant_a
FROM
    g_ordre_reparation
    JOIN g_vehicule_client ON vc_id = or_fk_or_vclient_id
    JOIN g_client ON c_id = vc_fk_client_vehicule_id
    JOIN g_vehicule ON v_id = vc_fk_catalogue_vehicule_id
    JOIN g_ordre_reparation_article ON ora_fk_ora_or_id = or_id
    JOIN g_article ON a_id = ora_fk_ora_article_id
WHERE
    vc_plaque = 'AA-123-AA'
ORDER BY
    or_id,
    ora_id;

-- SELECT Liste articles compatibles pour marque & modèle donnés
SELECT
    v_marque,
    v_type,
    a_ref,
    a_designation,
    a_marque,
    a_prix
FROM
    g_vehicule_article
    JOIN g_vehicule ON v_id = va_fk_vehicule_id
    JOIN g_article ON a_id = va_fk_article_id
WHERE
    v_marque = 'TOYOTA'
    AND v_type = 'YARIS';

-- SELECT Liste véhicules qui utilisent une référence donnée
SELECT
    a_ref,
    a_designation,
    a_marque,
    v_marque,
    v_type,
    v_energie
FROM
    g_vehicule_article
    JOIN g_article ON a_id = va_fk_article_id
    JOIN g_vehicule ON v_id = va_fk_vehicule_id
WHERE
    a_ref = 'KT0WFQA';

-- SELECT Récap OR
-- 1 ligne = client / véhicule / main d'oeuvre / article / montant total OR
SELECT
    -- Client
    c_nom,
    c_adresse,
    c_telephone,
    -- Véhicule client
    vc_plaque,
    vc_annee,
    v_marque,
    v_type,
    v_energie,
    -- OR
    or_id,
    or_main_doeuvre_qty,
    or_montant_mo,
    mo_tarif_horaire,
    -- Articles OR
    a_ref,
    a_designation,
    a_marque,
    a_prix,
    ora_qty,
    ora_montant_a,
    -- Total par OR (main d'oeuvre + somme montant_a)
    or_montant_mo -- calculé par le trigger
    + IFNULL ( -- Si pas d'article, 0 au lieu de NULL
        SUM(ora_montant_a) -- somme de tous les montant_a(ORA) de l'OR
        OVER (
            PARTITION BY -- affichage de chaque ORA avec ses détails (inverse GROUP BY)
                or_id
        ),
        0
    ) AS or_total_ttc -- nom arbitraire de la colonne
FROM
    g_ordre_reparation
    JOIN g_vehicule_client ON vc_id = or_fk_or_vclient_id
    JOIN g_client ON c_id = vc_fk_client_vehicule_id
    JOIN g_vehicule ON v_id = vc_fk_catalogue_vehicule_id
    JOIN g_main_doeuvre ON mo_id = or_fk_or_g_main_doeuvre_id
    LEFT JOIN g_ordre_reparation_article ON ora_fk_ora_or_id = or_id
    LEFT JOIN g_article ON g_article.a_id = ora_fk_ora_article_id
    -- Filtre plaque :
    -- vc_plaque = 'AA-123-AA'
ORDER BY
    c_nom,
    vc_plaque,
    or_id,
    ora_id;

-- SELECT Récap OR
--  1 ligne = client / véhicule / main d'oeuvre / totaux articles / total MO / total TTC
SELECT
    -- Client + véhicule + véhicule client
    c_nom,
    vc_plaque,
    v_marque,
    v_type,
    v_energie,
    -- OR
    or_id,
    or_main_doeuvre_qty,
    or_montant_mo,
    mo_tarif_horaire,
    -- Totaux : articles, main d'oeuvre, total TTC
    IFNULL (SUM(ora_montant_a), 0) AS total_articles, -- Si pas d'article, 0 au lieu de NULL
    or_montant_mo AS total_main_oeuvre,
    or_montant_mo + IFNULL (SUM(ora_montant_a), 0) AS total_or_ttc
FROM
    g_ordre_reparation
    JOIN g_vehicule_client ON vc_id = or_fk_or_vclient_id
    JOIN g_client ON c_id = vc_fk_client_vehicule_id
    JOIN g_vehicule ON v_id = vc_fk_catalogue_vehicule_id
    JOIN g_main_doeuvre ON mo_id = or_fk_or_g_main_doeuvre_id
    LEFT JOIN g_ordre_reparation_article ON ora_fk_ora_or_id = or_id
    -- Filtre plaque :
    -- WHERE vc_plaque = 'AA-123-AA'
GROUP BY
    c_nom,
    vc_plaque,
    v_marque,
    v_type,
    v_energie,
    or_id,
    or_main_doeuvre_qty,
    or_montant_mo,
    mo_tarif_horaire
ORDER BY
    c_nom,
    vc_plaque,
    or_id;

-- SCENARIO DE TEST TRIGGER
-- Vérifier le stock et le prix d'un article avant le test
--  article id = 73
-- !!!!!!!!STOCK INITIAL = 30!!!!!!!!!!!
SELECT
    a_id,
    a_ref,
    a_designation,
    a_qty,
    a_prix
FROM
    g_article
WHERE
    a_id = 73;

-- Crerer ordre de réparation
-- vc_id = 1
INSERT INTO
    g_ordre_reparation (
        or_main_doeuvre_qty,
        or_fk_or_vclient_id,
        or_fk_or_g_main_doeuvre_id
    )
VALUES
    (2.00, 1, 1);

-- Recup dernier OR créé !!!!!!!!!!!!!!!!ET NOTER SON ID!!!!!!!!!!!!!!!!!!
-- !!!!!!!or_id = 7!!!!!!!
SELECT
    *
FROM
    g_ordre_reparation
ORDER BY
    or_id DESC
LIMIT
    1;

-- Créer ORA
INSERT INTO
    g_ordre_reparation_article (ora_qty, ora_fk_ora_article_id, ora_fk_ora_or_id)
VALUES
    (3.00, 73, 5) -- !!!!!!!!!!!!!!!Utiliser ID de l'OR NOTE A LA PLACE DE 5!!!!!!!!!!!!!!!!!!!!!!!!!!!
;

-- Verif stock article après
-- !!!!!!!!STOCK FINAL = 27!!!!!!!!!!!
SELECT
    a_id,
    a_ref,
    a_designation,
    a_qty,
    a_prix
FROM
    g_article
WHERE
    a_id = 73;

-- Vérifier montant_a calculé par le trigger
SELECT
    *
FROM
    g_ordre_reparation_article
WHERE
    ora_fk_ora_or_id = 5;

-- !!!!!!!!!!!!!!!Utiliser ID de l'OR NOTE A LA PLACE DE 5!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Vérif montant_mo calculé par le trigger
SELECT
    *
FROM
    g_ordre_reparation
WHERE
    or_id = 5;

-- !!!!!!!!!!!!!!!Utiliser ID de l'OR NOTE A LA PLACE DE 5!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Rcap OR : articles & totaux
SELECT
    c_nom,
    vc_plaque,
    v_marque,
    v_type,
    v_energie,
    or_id,
    or_main_doeuvre_qty,
    or_montant_mo,
    IFNULL (SUM(ora_montant_a), 0) AS total_articles,
    or_montant_mo + IFNULL (SUM(ora_montant_a), 0) AS total_or_ttc
FROM
    g_ordre_reparation
    JOIN g_vehicule_client ON vc_id = or_fk_or_vclient_id
    JOIN g_client ON c_id = vc_fk_client_vehicule_id
    JOIN g_vehicule ON v_id = vc_fk_catalogue_vehicule_id
    LEFT JOIN g_ordre_reparation_article ON ora_fk_ora_or_id = or_id
WHERE
    or_id = 5 -- !!!!!!!!!!!!!!!Utiliser ID de l'OR NOTE A LA PLACE DE 5!!!!!!!!!!!!!!!!!!!!!!!!!!!
GROUP BY
    c_nom,
    vc_plaque,
    v_marque,
    v_type,
    v_energie,
    or_id,
    or_main_doeuvre_qty,
    or_montant_mo;

-- SELECT Liste a_designation avec quantité totale & nb de références GROUP BY a_designation
SELECT
    a_designation,
    COALESCE(SUM(a_qty), 0) AS total_qty,
    COUNT(*) AS nb_ref
FROM
    g_article
GROUP BY
    a_designation
ORDER BY
    a_designation;

-- SELECT Liste a_designation avec quantité totale et nombre de références, GROUP BY a_designation & a_marque
SELECT
    a_designation,
    a_marque,
    COALESCE(SUM(a_qty), 0) AS total_qty,
    COUNT(*) AS nb_ref
FROM
    g_article
GROUP BY
    a_designation,
    a_marque
ORDER BY
    a_designation,
    a_marque;

-- Nombre total d'articles
SELECT
    COUNT(*) AS nb_total
FROM
    g_article;

-- Nombre de ref par marque
SELECT
    a_marque,
    COUNT(*) AS références
FROM
    g_article
GROUP BY
    a_marque
ORDER BY
    références DESC,
    a_marque;

-- Nombre d'occurrences par marque (au moins 2)
SELECT
    a_marque,
    COUNT(*) AS occurrences
FROM
    g_article
GROUP BY
    a_marque
HAVING
    occurrences > 1
ORDER BY
    occurrences DESC;

-- Nombre de passages par client & par voiture
SELECT
    c_nom,
    c_telephone,
    vc_plaque,
    vc_annee,
    v_marque,
    v_type,
    v_energie,
    COUNT(or_id) AS nb_passages -- nb d'OR pour 1 client/voiture
FROM
    g_ordre_reparation
    JOIN g_vehicule_client ON vc_id = or_fk_or_vclient_id
    JOIN g_client ON c_id = vc_fk_client_vehicule_id
    JOIN g_vehicule ON v_id = vc_fk_catalogue_vehicule_id
GROUP BY
    c_id,
    c_nom,
    c_telephone,
    vc_id,
    vc_plaque,
    vc_annee,
    v_marque,
    v_type,
    v_energie
ORDER BY
    nb_passages DESC,
    c_nom,
    vc_plaque;

-- Liste des articles fournis pour toutes les interventions
SELECT
    or_id,
    ora_id,
    a_ref,
    a_designation,
    a_marque,
    ora_qty,
    ora_montant_a
FROM
    g_ordre_reparation_article
    JOIN g_article ON a_id = ora_fk_ora_article_id
    JOIN g_ordre_reparation ON or_id = ora_fk_ora_or_id
ORDER BY
    or_id,
    ora_id;

-- Liste les articles utilisés pour tous les OR
SELECT
    a_ref,
    a_designation,
    a_marque,
    SUM(ora_qty) AS total_qte_utilisee,
    SUM(ora_montant_a) AS total_montant
FROM
    g_ordre_reparation_article
    JOIN g_article ON a_id = ora_fk_ora_article_id
GROUP BY
    a_id,
    a_ref,
    a_designation,
    a_marque
ORDER BY
    a_marque,
    a_designation;

-- UPDATE augmenter le stock de 100 si < 20
UPDATE g_article
SET
    a_qty = a_qty + 100
WHERE
    a_qty < 20;