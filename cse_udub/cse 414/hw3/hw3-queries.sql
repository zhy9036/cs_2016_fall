/*
CSE 414 hw3
Yang Zhang 1030416
*/



/*
problem 1
137 rows returned
*/

select distinct c.role, a.fname, a.lname, m.name 
	from actor a, casts c, movie m
		where a.id = c.pid and m.id = c.mid and exists
			(select count(*) 
				from casts c1
					where a.id = c1.pid and m.id = c1.mid and m.year = 2010
					group by c1.pid, c1.mid 
					having count(*)>=5)
			
 
/*
problem 2
129 rows returned
*/

select m.year, count(*) from movie m
where not exists (select * from actor a, casts c
where a.gender = 'M' and c.pid = a.id and c.mid = m.id) 
group by m.year;

/*
problem 3
129 rows returned
*/


select m.year,convert(decimal(18,2),count(*)*100.00/(select count(*) from movie m2 where m2.year = m.year group by m2.year)), 
(select count(*) from movie m3 where m3.year = m.year group by m3.year) 
	from movie m
		where not exists (select * from actor a, casts c
		where a.gender = 'M' and c.pid = a.id and c.mid = m.id ) 
			group by m.year;

/*
problem 4
1 rows returned (Around the World in Eighty Days, 1298)
*/
select m2.id, m2.name, count(*) from movie m2, casts c2
 where c2.mid=m2.id
 group by m2.name, m2.id
 having count(*) = (select max(hala) as maxnum from 
  (select count(distinct c1.pid) as hala
   from casts c1
     group by c1.mid) as temp)
       
/*
problem 5
1 rows returned (2000 457841)
*/

select top 1 * from
(select (finalset.outyear-9), finalset.sumGap as summ
 from (select xxx.year as outyear,(select sum(singleyear.yearcount) as Sumyears 
   from (select year, count(id) as yearcount from movie group by year) as singleyear    
   where xxx.year >=singleyear.year-9 and xxx.year <= singleyear.year ) as sumGap 
  from movie xxx group by xxx.year) as finalset) as res
order by res.summ desc


/*
problem 6
1 rows returned (521876)
*/

select count(distinct pid) from casts
	where mid in (select mid from casts where pid in (select pid from casts where mid in 
				(select mid from actor, casts where pid= id and fname='Kevin' and lname = 'Bacon' ))) 
	and pid not in  (select pid from casts where mid in 
				(select mid from actor, casts where pid= id and fname='Kevin' and lname = 'Bacon' ))
	




/*
Part C
I really enjoying using DBMS, because by working on cloud I don't need spend time to download client
program which saving time and storage. The idea of offering DBMS to public is nice, because Microsoft
could get huge profit from it and the costumers have the convenience to manage their own data.
*/
















