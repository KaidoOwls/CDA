CALL Lst_Commandes('%cad%');
DELIMITER //

CREATE PROCEDURE CA_Fournisseur(
    IN p_numfou INT,
    IN p_annee INT
)
BEGIN
    SELECT
        SUM(ligcom.qtecde * ligcom.priuni) AS CAPotentiel
    FROM
        entcom
            JOIN ligcom ON entcom.numcom = ligcom.numcom
    WHERE
            entcom.numfou = p_numfou
      AND YEAR(entcom.datcom) = p_annee;
END //

DELIMITER ;

CALL CA_Fournisseur(120, 2022);
