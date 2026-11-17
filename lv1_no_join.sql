-- 01
select citta, count(*)
from cliente
group by citta
having citta = 'Roma';

-- 02
select importo
from cliente
where importo > 200
order by importo

-- 03
SELECT *
FROM Ordini
WHERE data_ordine BETWEEN '2026-02-01' AND '2026-03-31'
  AND importo BETWEEN 100 AND 500;

--04
SELECT COUNT(*), AVG(importo), MAX(importo), MIN(importo)
FROM Ordini;


--05
SELECT id_cliente, COUNT(*), SUM(importo)
FROM Ordini
GROUP BY id_cliente
HAVING COUNT(*) >= 3;


--06
SELECT nome, cognome, citta, data_ordine, importo
FROM Clienti
JOIN Ordini ON Clienti.id_cliente = Ordini.id_cliente
ORDER BY data_ordine DESC;


--07
SELECT nome, cognome, citta, importo
FROM Clienti
JOIN Ordini ON Clienti.id_cliente = Ordini.id_cliente
WHERE citta IN ('Torino', 'Milano', 'Roma')
AND importo > 150;


--08
SELECT nome, cognome, COUNT(*), SUM(importo)
FROM Clienti
JOIN Ordini ON Clienti.id_cliente = Ordini.id_cliente
GROUP BY Clienti.id_cliente
ORDER BY SUM(importo) DESC;


--09
SELECT nome, cognome, SUM(importo)
FROM Clienti
JOIN Ordini ON Clienti.id_cliente = Ordini.id_cliente
GROUP BY Clienti.id_cliente
HAVING SUM(importo) > 600;


--10
SELECT nome, cognome, COUNT(*), AVG(importo)
FROM Clienti
JOIN Ordini ON Clienti.id_cliente = Ordini.id_cliente
GROUP BY Clienti.id_cliente
HAVING COUNT(*) >= 3 AND AVG(importo) > 200;


--11
SELECT citta, COUNT(*), SUM(importo), AVG(importo)
FROM Clienti
JOIN Ordini ON Clienti.id_cliente = Ordini.id_cliente
GROUP BY citta
HAVING SUM(importo) > 700;


--12
SELECT nome, cognome, COUNT(*), SUM(importo)
FROM Clienti
JOIN Ordini ON Clienti.id_cliente = Ordini.id_cliente
WHERE data_ordine >= '2026-03-01'
AND data_ordine < '2026-07-01'
GROUP BY Clienti.id_cliente
HAVING COUNT(*) >= 2 AND SUM(importo) > 400;


--13
SELECT nome, cognome, COUNT(*), SUM(importo), MAX(importo)
FROM Clienti
JOIN Ordini ON Clienti.id_cliente = Ordini.id_cliente
GROUP BY Clienti.id_cliente
HAVING MAX(importo) > 500 AND SUM(importo) > 800;


--14
SELECT nome, cognome, SUM(importo)
FROM Clienti
JOIN Ordini ON Clienti.id_cliente = Ordini.id_cliente
GROUP BY Clienti.id_cliente
HAVING SUM(importo) > (
    SELECT AVG(totale)
    FROM (
        SELECT SUM(importo) AS totale
        FROM Ordini
        GROUP BY id_cliente
    ) AS T
);


--15
SELECT nome, cognome, citta, COUNT(*), SUM(importo), AVG(importo), MAX(importo)
FROM Clienti
JOIN Ordini ON Clienti.id_cliente = Ordini.id_cliente
GROUP BY Clienti.id_cliente
HAVING COUNT(*) >= 3
AND SUM(importo) > 500
AND AVG(importo) > (SELECT AVG(importo) FROM Ordini)
AND MAX(importo) > 300
ORDER BY SUM(importo) DESC;
