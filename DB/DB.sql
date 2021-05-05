DROP DATABASE IF EXISTS tsw;
CREATE DATABASE tsw;
USE tsw;

DROP TABLE IF EXISTS prodotto;

CREATE TABLE prodotto (
  Id_Prodotto int primary key AUTO_INCREMENT,
  Nome char(20) not null,
  Descrizione char(300),
  Quantità int default 0,
  Prezzo double default 0
);

INSERT INTO prodotto (Id_Prodotto, Nome, Descrizione, Quantità, Prezzo)
Values ('1', 'Tastiera', 'Hermes RGB', '20', '45');
INSERT INTO prodotto (Id_Prodotto, Nome, Descrizione, Quantità, Prezzo)
Values ('2', 'Webcam', 'Logitech C920 720p', '10', '70');
INSERT INTO prodotto (Id_Prodotto, Nome, Descrizione, Quantità, Prezzo)
Values ('3', 'Microfono', 'GXT Trust con stand', '20', '20');
INSERT INTO prodotto (Id_Prodotto, Nome, Descrizione, Quantità, Prezzo)
Values ('4', 'Mouse', 'Logitech G402', '10', '50');
INSERT INTO prodotto (Id_Prodotto, Nome, Descrizione, Quantità, Prezzo)
Values ('5', 'Tavoletta Grafica', 'Wacom', '5', '35')
