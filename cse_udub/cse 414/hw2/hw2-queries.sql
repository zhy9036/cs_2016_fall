
/*
problem 1
13 rows returned
*/

select a.fname, a.lname from actor a, movie m, casts c 
where m.name='Officer 444'  AND  c.mid = m.id AND c.pid = a.id;

/*
problem 2
113 rows returned
*/
select d.fname, d.lname, m.name, m.year from directors d, movie m, genre g, movie_directors md
where g.genre = 'Film-Noir' AND m.id = g.mid AND g.mid = md.mid AND md.did = d.id AND m.year%4 = 0;

/*
problem 3
53 rows returned
*/

select distinct a.id, a.fname, a.lname from actor a, movie m1, movie m2, casts c1, casts c2
 where m1.id = c1.mid AND m2.id = c2.mid AND c1.pid=a.id AND c2.pid = a.id
 and m1.year< 1900 and m2.year>2000;
 
 
 /*helper quary 1*/
 select m.name from movie m, casts c
 where c.pid = 142047 and m.id = c.mid 
 and m.year> 2000;
 
 /*helper quary 2*/
  select m.name from movie m, casts c
 where c.pid = 142047 and m.id = c.mid 
 and m.year< 1900;
 
 /* From the helper queries, it turns out that those films that re-filmed at least once */
 
 
/*
problem 4
47 rows returned
 */
 
 select d.fname, d.lname, count(*) from directors d, movie m, movie_directors md
 where d.id = md.did AND md.mid = m.id
 group by  d.fname, d.lname
 having count(*) >= 500
 order by count(*) desc; 
 
/*
problem 5
24 rows returned
*/

select distinct a.id, a.fname, a.lname, m.name, count(*) from actor a, movie m, casts c
where a.id = c.pid AND c.mid = m.id AND m.year = 2010
group by a.id, m.name
having count(*) >= 5;