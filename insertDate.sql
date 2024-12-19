-- Populeaza tabelul Utilizatori
INSERT INTO Utilizatori (NumeUtilizator, Email, ParolaHash, DataCrearii)
VALUES 
    ('Radu', 'radu@exemplu.com', 'parola_hashata_4', '2023-11-01 09:00:00'),
    ('Andreea', 'andreea@exemplu.com', 'parola_hashata_5', '2020-11-05 10:15:00'),
    ('Mircea', 'mircea@exemplu.com', 'parola_hashata_6', '2024-11-10 14:30:00'),
    ('Ion', 'ion@exemplu.com', 'parola_hashata_7', '2024-11-15 08:45:00'),
    ('Elena', 'elena@exemplu.com', 'parola_hashata_8', '2022-11-20 11:20:00'),
    ('Mihai', 'mihai@exemplu.com', 'parola_hashata_9', '2021-11-25 13:35:00');

-- Populeaza tabelul Categorii
INSERT INTO Categorii (Nume)
VALUES 
    ('Tehnologie'),
    ('Sanatate'),
    ('Divertisment'),
    ('Stiinta'),
    ('Educatie');

-- Populeaza tabelul Postari
INSERT INTO Postari (UtilizatorID, Titlu, Continut, DataCrearii)
VALUES 
    (1, 'AI si viitorul locurilor de munca', 'Cum va schimba inteligenta artificiala locurile de munca?', '2023-11-02 08:00:00'),
    (2, 'Cum sa ramani activ si sanatos', 'Sfaturi pentru a ramane activ si a preveni bolile.', '2020-11-06 09:30:00'),
    (3, 'Tehnologii emergente in medicina', 'Cum sunt utilizate noile tehnologii pentru a salva vieti.', '2024-11-11 11:45:00'),
    (4, 'Tendinte in educatie digitala', 'Cum evolueaza educatia in era digitala?', '2024-11-16 12:00:00'),
    (5, 'Astrofizica si misterele universului', 'Explorarea universului prin astrofizica.', '2022-11-21 15:15:00'),
    (6, 'Sanatatea mentala in era digitala', 'Cum influenteaza tehnologia sanatatea mentala?', '2021-11-26 16:30:00'),
	(1, 'Viitorul Calculului Cuantic', 'Explorarea potentialului calculului cuantic in urmatorul deceniu.', '2023-11-03 17:45:00'),
    (2, 'Explorarea Realitatii Virtuale in Educatie', 'Cum poate realitatea virtuala sa revolutioneze experientele de invatare.', '2020-11-08 18:00:00'),
    (3, 'Beneficiile unei Diete pe Baza de Plante', 'Un studiu aprofundat asupra avantajelor unei diete pe baza de plante.', '2024-11-13 19:00:00');

-- Populeaza tabelul Comentarii
INSERT INTO Comentarii (PostareID, UtilizatorID, Continut, DataCrearii)
VALUES 
    (1, 2, 'Interesant punct de vedere. Va fi fascinant sa vedem cum evolueaza acest domeniu.', '2023-11-03 09:15:00'),
    (1, 3, 'Cred ca AI-ul va crea noi locuri de munca, nu doar va inlocui oamenii.', '2024-11-12 10:30:00'),
    (2, 1, 'Un articol foarte util. Mi-a placut abordarea practica a stilului de viata sanatos.', '2023-11-04 11:45:00'),
    (3, 4, 'Tehnologia in medicina este extrem de promitatoare! Avem mult de castigat de la ea.', '2024-11-17 12:00:00'),
    (4, 5, 'Foarte bun articolul! Educatia digitala este cheia viitorului.', '2022-11-22 14:00:00'),
    (5, 6, 'Mi-a placut cum ai explicat fenomenele din astrofizica. Iti recomand un documentar pe aceasta tema.', '2021-11-27 15:15:00'),
    (6, 1, 'Sanatatea mentala este esentiala si trebuie luata mai serios. Tehnologia poate ajuta in acest sens.', '2023-11-05 16:30:00'),
    (2, 3, 'Ma bucur ca ai abordat acest subiect, este esential pentru viata noastra de zi cu zi.', '2024-11-12 17:45:00'),
    (3, 2, 'Imi place cum ai explicat noile progrese in medicina! Astept cu nerabdare sa aflu mai multe.', '2023-11-06 18:30:00');



-- Populeaza tabelul PostCategorie cu relatiile dintre postari si categorii
INSERT INTO PostCategorie (PostareID, CategorieID)
VALUES 
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 1),
    (7, 2),
    (8, 4),
    (9, 3);
