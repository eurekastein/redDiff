select sub.id, sub.geom
 from
 (select original.id, original.geom, cortadas.id_cortadas
 from red as original
 left join 
	(select r.id as id_cortadas, st_collectionextract(st_union(r.geom, p.geom),2) as geom
	from slope p, red r) as cortadas
on st_equals(original.geom, cortadas.geom)) as sub
where sub.id_cortadas is NULL
