select 
    m.id, m.title, m.year, m.id_director,
    d.id, d.name
from 
    movies m left join  stars d on m.id_director = d.id
where m.title = 'Bullet Train';

select 
    m.id, m.title, m.year, m.id_director,
    d.id, d.name
from 
    movies m left join  stars d on m.id_director = d.id
where m.title = 'OSS 117: Le Caire, nid d''espions';

select 
    m.id, m.title, m.year, m.id_director,
    d.id, d.name
from 
    movies m left join  stars d on m.id_director = d.id
where m.title = 'Blitz';

