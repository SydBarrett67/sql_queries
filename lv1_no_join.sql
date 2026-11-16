-- 01
select citta, count(*)
from cliente
group by citta
having citta = 'Roma';

-- 02
select citta, count(*)
from cliente
group by citta
having citta = 'Roma';
