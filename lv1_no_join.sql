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
