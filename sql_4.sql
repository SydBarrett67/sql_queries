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
    and nazionalita = "Giappone" 
    or nazionalita = "Francia"
    and annoproduzione > 1990

-- 04
select titolo
from film
where genere = "Fantascienza"
    and nazionalita = "Giappone"
    and annoproduzione > 1990
    or  nazionalita = "Francia"

-- 05
select titolo
from film
group by regista
having 
