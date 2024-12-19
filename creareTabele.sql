-- Creeaza tabelul Utilizatori
CREATE TABLE Utilizatori (
    UtilizatorID INT PRIMARY KEY IDENTITY(1,1),
    NumeUtilizator NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    ParolaHash NVARCHAR(255) NOT NULL,
    DataCrearii DATETIME DEFAULT GETDATE()
);

-- Creeaza tabelul Categorii
CREATE TABLE Categorii (
    CategorieID INT PRIMARY KEY IDENTITY(1,1),
    Nume NVARCHAR(50) NOT NULL UNIQUE
);

-- Creeaza tabelul Postari
CREATE TABLE Postari (
    PostareID INT PRIMARY KEY IDENTITY(1,1),
    UtilizatorID INT NOT NULL,
    Titlu NVARCHAR(200) NOT NULL,
    Continut TEXT NOT NULL,
    DataCrearii DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UtilizatorID) REFERENCES Utilizatori(UtilizatorID)
);

-- Creeaza tabelul Comentarii
CREATE TABLE Comentarii (
    ComentariuID INT PRIMARY KEY IDENTITY(1,1),
    PostareID INT NOT NULL,
    UtilizatorID INT NOT NULL,
    Continut TEXT NOT NULL,
    DataCrearii DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (PostareID) REFERENCES Postari(PostareID),
    FOREIGN KEY (UtilizatorID) REFERENCES Utilizatori(UtilizatorID)
);

-- Creeaza tabelul PostCategorie
CREATE TABLE PostCategorie (
    PostareID INT NOT NULL,
    CategorieID INT NOT NULL,
    PRIMARY KEY (PostareID, CategorieID),
    FOREIGN KEY (PostareID) REFERENCES Postari(PostareID),
    FOREIGN KEY (CategorieID) REFERENCES Categorii(CategorieID)
);