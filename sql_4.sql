-- 01
select nome
from sale
where citta = "Pisa"

-- 02
select titolo
from film
where regista = "F. Fellini"
    and annoproduzione > 1960

-- 03
select titolo
from film
where genere = "Fantascienza"
    and (nazionalita = "Giappone" or nazionalita = "Francia")
    and annoproduzione > 1990

-- 04
select titolo
from film
where (genere = "Fantascienza"
    and nazionalita = "Giappone"
    and annoproduzione > 1990)
    or nazionalita = "Francia"

-- 05
select titolo
from film f1, film f2
where f1.regista = f2.regista
    and f2.titolo = "Casablanca"

-- 06
select titolo, genere
from film, proiezioni
where film.codfilm = proiezioni.codfilm
    and dataproiezione = "2004-12-25"

-- 07
select titolo, genere
from film, proiezioni, sale
where film.codfilm = proiezioni.codfilm
    and proiezioni.codsala = sale.codsala
    and citta = "Napoli"
    and dataproiezione = "2004-12-25"

-- 08
select nome
from sale, proiezioni, film, recita, attori
where sale.codsala = proiezioni.codsala
    and proiezioni.codfilm = film.codfilm
    and film.codfilm = recita.codfilm
    and recita.codattore = attori.codattore
    and citta = "Napoli"
    and dataproiezione = "2004-12-25"
    and attori.nome = "R. Williams"

-- 09
select titolo
from film, recita, attori
where film.codfilm = recita.codfilm
    and recita.codattore = attori.codattore
    and (attori.nome = "M. Mastroianni"
    or attori.nome = "S. Loren")

-- 10
select titolo, nome
from film, recita, attori
where film.codfilm = recita.codfilm
    and recita.codattore = attori.codattore
    and nazionalita = "Francia"

-- 11
select titolo, nome
from film, proiezioni, sale
where film.codfilm = proiezioni.codfilm
    and proiezioni.codsala = sale.codsala
    and citta = "Pisa"
    and dataproiezione >= "2005-01-01"
    and dataproiezione < "2005-02-01"

-- 12
select count(*)
from sale
where citta = "Pisa"
    and posti > 60

-- 13
select sum(posti)
from sale
where citta = "Pisa"

-- 14
select citta, count(*)
from sale
group by citta

-- 15
select citta, count(*)
from sale
where posti > 60
group by citta

-- 16
select regista, count(*)
from film
where annoproduzione > 1990
group by regista

-- 17
select regista, sum(incasso)
from film, proiezioni
where film.codfilm = proiezioni.codfilm
group by regista

-- 18
select titolo, count(*), sum(incasso)
from film, proiezioni, sale
where film.codfilm = proiezioni.codfilm
    and proiezioni.codsala = sale.codsala
    and regista = "S. Spielberg"
    and citta = "Pisa"
group by film.codfilm, titolo

-- 19
select regista, nome, count(*)
from film, recita, attori
where film.codfilm = recita.codfilm
    and recita.codattore = attori.codattore
group by regista, nome

-- 20
select regista, titolo
from film, recita
where film.codfilm = recita.codfilm
group by film.codfilm, regista, titolo
having count(codattore) < 6

-- 21
select film.codfilm, titolo, sum(incasso)
from film, proiezioni
where film.codfilm = proiezioni.codfilm
    and annoproduzione > 2000
group by film.codfilm, titolo

-- 22
select count(distinct recita.codattore)
from recita, attori
where recita.codattore = attori.codattore
group by recita.codfilm
having max(ann onascita) < 1970

-- 23
select titolo, sum(incasso)
from film, proiezioni
where film.codfilm = proiezioni.codfilm
    and genere = "Fantascienza"
group by film.codfilm, titolo

-- 24
select titolo, sum(incasso)
from film, proiezioni
where film.codfilm = proiezioni.codfilm
    and genere = "Fantascienza"
    and dataproiezione > "2001-01-01"
group by film.codfilm, titolo

-- 25
select titolo, sum(incasso)
from film, proiezioni
where film.codfilm = proiezioni.codfilm
    and genere = "Fantascienza"
group by film.codfilm, titolo
having min(dataproiezione) >= "2001-01-01"

-- 26
select nome, sum(incasso)
from sale, proiezioni
where sale.codsala = proiezioni.codsala
    and citta = "Pisa"
    and dataproiezione >= "2005-01-01"
    and dataproiezione < "2005-02-01"
group by sale.codsala, nome
having sum(incasso) > 20000
