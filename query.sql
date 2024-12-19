-- JOIN pentru a afisa postari si categoriile lor
SELECT 
    p.Titlu AS Postare_Titlu,
    c.Nume AS Categorie_Nume
FROM 
    Postari p
INNER JOIN 
    PostCategorie pc ON p.PostareID = pc.PostareID
INNER JOIN 
    Categorii c ON pc.CategorieID = c.CategorieID;

-- Obtine posturile impreuna cu informatiile utilizatorilor, doar posturile create dupa 2022-01-01
SELECT 
    U.NumeUtilizator AS NumeUtilizator, 
    P.Titlu AS TitluPostare, 
    P.DataCrearii
FROM 
    Utilizatori U
INNER JOIN 
    Postari P ON U.UtilizatorID = P.UtilizatorID
WHERE 
    P.DataCrearii > '2022-01-01';


-- LEFT JOIN pentru a afisa toate postările, chiar si cele fara categorie
SELECT 
    p.Titlu AS Postare_Titlu,
    c.Nume AS Categorie_Nume
FROM 
    Postari p
LEFT JOIN 
    PostCategorie pc ON p.PostareID = pc.PostareID
LEFT JOIN 
    Categorii c ON pc.CategorieID = c.CategorieID;


-- Afiseaza cate postari exista pentru fiecare categorie
SELECT 
    c.Nume AS Categorie_Nume, 
    COUNT(p.PostareID) AS Nr_Postari
FROM 
    Categorii c
LEFT JOIN 
    PostCategorie pc ON c.CategorieID = pc.CategorieID
LEFT JOIN 
    Postari p ON pc.PostareID = p.PostareID
GROUP BY 
    c.Nume;

-- Grupeaza posturile dupa numele utilizatorilor si numara posturile fiecarui utilizator care are mai mult de o postare
SELECT 
    U.NumeUtilizator AS NumeUtilizator, 
    COUNT(P.PostareID) AS NumarPostari
FROM 
    Utilizatori U
LEFT JOIN 
    Postari P ON U.UtilizatorID = P.UtilizatorID
GROUP BY 
    U.NumeUtilizator
HAVING 
    COUNT(P.PostareID) > 1;



-- Afiseaza toate postarile din categoriile "Tehnologie" si "Sanatate"
SELECT Titlu FROM Postari
WHERE PostareID IN (SELECT PostareID FROM PostCategorie WHERE CategorieID = 1)
UNION
SELECT Titlu FROM Postari
WHERE PostareID IN (SELECT PostareID FROM PostCategorie WHERE CategorieID = 2);


-- Afiseaza postari grupate pe categorie, cu subtotaluri pentru fiecare categorie
SELECT 
    c.Nume AS Categorie_Nume, 
    COUNT(p.PostareID) AS Nr_Postari
FROM 
    Categorii c
LEFT JOIN 
    PostCategorie pc ON c.CategorieID = pc.CategorieID
LEFT JOIN 
    Postari p ON pc.PostareID = p.PostareID
GROUP BY 
    c.Nume WITH ROLLUP;

-- Numara posturile per utilizator in 2024 si adauga un total global folosind ROLLUP
SELECT 
    U.NumeUtilizator, 
    COUNT(P.PostareID) AS NumarPostari
FROM 
    Utilizatori U
LEFT JOIN 
    Postari P ON U.UtilizatorID = P.UtilizatorID
WHERE 
    YEAR(P.DataCrearii) = 2024
GROUP BY 
    U.NumeUtilizator
WITH ROLLUP;


-- Afiseaza combinatii de postari si categorii, cu subtotale si totaluri
SELECT 
    c.Nume AS Categorie_Nume, 
    COUNT(p.PostareID) AS Nr_Postari
FROM 
    Categorii c
LEFT JOIN 
    PostCategorie pc ON c.CategorieID = pc.CategorieID
LEFT JOIN 
    Postari p ON pc.PostareID = p.PostareID
GROUP BY 
    c.Nume WITH CUBE;


-- Numara posturile pe utilizator si data, adaugand totaluri pentru fiecare combinatia posibila cu CUBE
SELECT 
    U.NumeUtilizator AS NumeUtilizator, 
    YEAR(P.DataCrearii) AS An,
    MONTH(P.DataCrearii) AS Luna,
    COUNT(P.PostareID) AS NumarPostari
FROM 
    Utilizatori U
LEFT JOIN 
    Postari P ON U.UtilizatorID = P.UtilizatorID
GROUP BY 
    U.NumeUtilizator, YEAR(P.DataCrearii), MONTH(P.DataCrearii)
WITH CUBE;