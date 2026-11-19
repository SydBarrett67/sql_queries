-- 01
select *
from smartphone

-- 02
select nome, ram, cpu, dimensioni
from smartphone

-- 03
select nome
from smartphone
where display_resolution = "1080x1920"

-- 04
select nome
from smartphone
where display_resolution = "1080x1920" 
    and ram = "3Gb"

-- 05
select *
from smartphone
where nome like "Galaxy%"

-- 06
select *
from smartphone
where cpu like "%dual-core%"

-- 07
select *
from smartphone
where peso > 150

-- 08
select *
from smartphone
where cpu like "%Quad_core%"
order by display_ppi

-- 09
select S.nome, M.brand
from smartphone S, marca M
where S.id_marca = M.id

-- 10
select *
from smartphone S, os O
order by O.descrizione 

-- 11
select *
from smartphone S, os O
order by O.descrizione 

-- 12
select *
from smartphone S, os O
where S.id_os = O.id
    and O.descrizione = "Android"
order by S.peso

-- 13
select *
from smartphone S, marca M 
where S.id_os = M.id
    and M.brand = "Samsung"
order by S.peso

-- 14
select S.*, M.brand, O.descrizione
from smartphone S, marca M, os O 

-- 15
select count(*)
from smartphone
where ram = "2Gb"

-- 16
select count(*)
from smartphone S, os O
where S.id_os = O.id and O.descrizione = "Windows Phone 8"

-- 17
select id_os, count(*)
from smartphone
group by id_os

-- 18
select S.*
from smartphone S, os O
where S.id_os = O.id 
    and O.descrizione = "Android"
order by S.peso
limit 1

-- 19
select S.*
from smartphone S, os O
where S.id_os = O.id 
    and O.descrizione = "Android"
order by S.display_ppi DESC
limit 1

-- 20
select avg(S.display_size)
from smartphone S
