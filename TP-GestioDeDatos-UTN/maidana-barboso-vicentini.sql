/*
 1-Para la emisora de radio LT10, listar la programación para la franja horaria central de
los martes, detallando programa, hora de inicio, duración, conductor(es). 
*/
select * 
from tpgrupo14.programa as pro
where  not exists (select * 
                   from tpgrupo14.emisora as em
                   where em.nombre= 'LT10' 
                   and not exists (select *
                                     from  tpgrupo14.franja_horaria as fh 
                                     where em.cuit_Emisora = fh.cuit_Emisora
                                     and pro.nombre_programa= fh.nombre_programa
                                     and fh.categoria= 'Central'
                                     and fh.dia_Emision='Martes'
                                     ));
 /*
 2- Listar los oyentes que han realizado comentarios en cada una de las notas de la
categoría “Arte” escritas por programas de la cadena de radio “Cadena del Litoral”
 */                                  
select * 
from tpgrupo14.Cuenta_Oyente as cu
where not exists (select * 
                  from tpgrupo14.Categoria as ca
                  where ca.es_Subcategoria = 'Arte'
                  and not exists( select * 
								  from tpgrupo14.nota_blog as nb inner join tpgrupo14.blog_programa as bp on(nb.id_blog = bp.id_blog) 
								 inner join tpgrupo14.programa as pro on(bp.nombre_programa =pro.nombre_programa) 
								 inner join tpgrupo14.franja_horaria as fh on(pro.nombre_programa= fh.nombre_programa)
								 inner join tpgrupo14.emisora as em on(em.cuit_Emisora = fh.cuit_Emisora)
								 inner join tpgrupo14.comentario as co on( co.id_nota = nb.id_nota)
								  inner join tpgrupo14.es_sede as es on(es.cuit_Emisora = em.cuit_Emisora)                                                         
                                  where ca.nombre_Categoria = nb.nombre_Categoria
                                  and cu.id_Oyente = co.id_Oyente
                                  and es.id_cadena = 3
								 ));
                                                          
														  
/*
3- Listar el Top 5 de las emisoras que en el trimestre enero-marzo 2021 han tenido la
menor cantidad de segundos de publicidad en su programación en franja horaria
central. Listar emisora y cantidad de segundos de publicidad emitida en el
trimestre
*/

select * from tpgrupo14.emisora as em
where em.cuit_Emisora in (select fh.cuit_Emisora from tpgrupo14.franja_horaria as fh, tpgrupo14.programa as pro
								      where pro.nombre_programa= fh.nombre_programa
						              and fh.categoria= 'Central'
	                                  and fh.nombre_programa in (
					                           select puc.nombre_programa 
                                               from tpgrupo14.Publica_Publicidad pp 
										  inner join tpgrupo14.publicidad pu on(pu.id_Publicidad=pp.id_Publicidad)
										  inner join tpgrupo14.Tanda_Publicitaria as tp on(tp.id_Tanda =pp.id_Tanda)
                                               inner join tpgrupo14.publica puc on(puc.id_Tanda =pp.id_Tanda) 
													   where tp.fecha_emision between '01-01-2021' and '31-03-2021'
													   and tp.id_Tanda = pp.id_Tanda
													   order by  pu.duracion asc
													     limit 5
											  )
								   );

-- segunda forma

Select em.nombre, sum(pu.Duracion) as DurTotal FROM tpgrupo14.emisora as em
			inner join tpgrupo14.franja_horaria as fh on (em.cuit_Emisora = fh.cuit_Emisora) 
			inner join tpgrupo14.publica as puc on (fh.nombre_programa = puc.nombre_programa)
			inner join tpgrupo14.Tanda_Publicitaria as tp on (tp.id_Tanda = puc.id_Tanda)
			inner join tpgrupo14.Publica_Publicidad as pp on (tp.id_Tanda = pp.id_Tanda)
			inner join tpgrupo14.publicidad as pu on (pp.id_Publicidad = pu.id_Publicidad)
			where tp.fecha_emision between '01-01-2021' and '31-03-2021'
													   and fh.categoria= 'Central'
			group by em.nombre
			order by DurTotal asc
			limit 5
			


/*
4-Para la emisora LT9, listar el programa al cual corresponde la nota escrita en su blog,
que recibió la mayor cantidad de comentarios positivos (4 o 5 estrellas) en los
últimos dos días. Se quiere conocer programa, conductor(es), título de la nota,
cantidad de comentarios recibidos. */
											  
	
				  select fh.nombre_programa, com.puntuacion, nc.nombre_conductor, nb.titulo as titulo_nota, count(com.id_comentario) from 
				  tpgrupo14.franja_horaria as fh inner join tpgrupo14.emisora as em on(em.cuit_Emisora = fh.cuit_Emisora)
				   inner join tpgrupo14.programa as pr on(pr.nombre_programa= fh.nombre_programa)
				   inner join tpgrupo14.nombre_conductor as nc on pr.nombre_programa = nc.nombre_programa
				   inner join tpgrupo14.blog_programa as bp on (bp.nombre_programa = pr.nombre_programa)
				   inner join tpgrupo14.nota_blog as nb on(nb.id_blog = bp.id_blog)
				   inner join tpgrupo14.comentario as com on (nb.id_nota = com.id_nota)
                where em.nombre = 'LT9'
              	and com.puntuacion >3
				and nb.fecha_publicacion between( CURRENT_DATE - 2) and CURRENT_DATE
				group by fh.nombre_programa, com.puntuacion, nc.nombre_conductor, nb.titulo;

/*
5- Para el programa “Noticias del Medio Dia” que se emite por radio Nacional, listar
todas las notas publicadas junto con los comentarios recibidos en las mismas (los
tengan o no), durante los últimos 30 días.
*/

Select bp.nombre as nombre_blog, b.fecha_publicacion as fecha_publicacion_nota, b.titulo as titulo_nota, co.texto as texto_comentario FROM tpgrupo14.emisora as em 
	inner join tpgrupo14.franja_horaria as fh on (em.cuit_Emisora = fh.cuit_Emisora)
	inner join tpgrupo14.blog_programa as bp on (fh.nombre_programa = bp.nombre_programa)
	inner join tpgrupo14.nota_blog as b on (bp.id_blog = b.id_blog)
	left join tpgrupo14.comentario as co on (b.id_nota = co.id_nota)
	where fh.nombre_programa = 'Noticias del Medio Dia' and  em.nombre = 'Radio Nacional' 
	and b.fecha_publicacion >= (NOW() - cast('30 days' as interval));



/*
6-Listar las emisoras de radio cuya recaudación total en concepto de publicidad, para los
últimos 7 días, sea mayor al promedio de recaudación por publicidad de todas las
emisoras, para el mismo período
*/

select * from tpgrupo14.emisora as em
where exists (select sum(pro.costo_publicidad * pu.duracion) as total,avg(pro.costo_publicidad * pu.duracion),fh.cuit_Emisora 
			  from tpgrupo14.franja_horaria as fh, tpgrupo14.programa as pro, 
			  tpgrupo14.publicidad as pu, tpgrupo14.Publica_Publicidad, 
			  tpgrupo14.Tanda_Publicitaria as tp
			  where pro.nombre_programa= fh.nombre_programa
			 and fh.cuit_Emisora = em.cuit_Emisora
			  and tp.fecha_emision between( CURRENT_DATE - 7) and CURRENT_DATE
			  group by fh.cuit_Emisora
			  having sum(pro.costo_publicidad * pu.duracion) > avg(pro.costo_publicidad * pu.duracion));

/*
7-Listar los nombres de los programas que sólo son emitidos en franjas horarias
centrales y por cadenas de radio compuestas por más de 5 emisoras. 
*/

select prog.nombre_programa from tpgrupo14.programa prog
inner join tpgrupo14.franja_horaria fh on fh.nombre_programa = prog.nombre_programa
inner join tpgrupo14.es_sede ES on fh.cuit_Emisora = ES.cuit_Emisora
where ES.id_cadena in (select ES.id_cadena from tpgrupo14.es_sede ES
						group by ES.id_cadena
						having count(ES.cuit_Emisora) > 5)
and fh.categoria = 'Central'



--Consulta nro 8: Listar aquellas cadenas de radio cuyo director es distinto al director de la emisora de
-- radio que es sede central de la cadena. Mostrar nombre de la cadena de radio,
-- nombre de la radio emisora sede central de la cadena, nombre del director de la
-- cadena, nombre del director de la radio emisora sede central.



select cr.nombre as nombre_cadena, emis.nombre as nombre_emisora, cr.nombre_director as director_cadena, emis.nombre_director as director_emisora
from tpgrupo14.cadena_radio cr
inner join tpgrupo14.es_sede ES on cr.id_cadena = ES.id_cadena
inner join tpgrupo14.emisora emis on ES.cuit_Emisora = emis.cuit_Emisora
where ES.es_Central = 1
and cr.nombre_director <> emis.nombre_director

