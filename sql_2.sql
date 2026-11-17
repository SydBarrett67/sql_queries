-- a
select nomeC
from Citta
where prov = "Torino"

-- b
select Gio
from Giocatore
where Costo > 10000 and cost < 20000
    and reti > 20 and reti < 30

-- c
select Gio
from Giocatore
order by Costo asc, reti desc

-- d
select SUM(G.Costo)
from Giocatore G
join Squadra S on G.CodSquadra = S.IdS
where S.NomeS = 'Inter';

-- e
select Gio
from Giocatore
where Gio like '%n';

-- f
select count(*)
from Giocatore
where Ruolo = "Portiere"

-- g
select distinct Ruolo
from Giocatore

-- h
select AVG(G.Costo)
from Giocatore G
join Squadra S on G.CodSquadra = S.IdS
join Citta C on S.CodCitta = C.IdC
where S.Prov = 'Torino';

-- i
select max(Punti)
from Squadra
where serie = "A"

-- j
select COUNT(*)
from Giocatore G
join Squadra S on G.CodSquadra = S.IdS
join Citta C on S.CodCitta = C.IdC
where C.Prov = 'Napoli';
