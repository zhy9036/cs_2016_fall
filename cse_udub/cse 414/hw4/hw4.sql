
3.1
select eid, name from employee 
	where eid in (select manger.eid from manager 
					group by manager.eid
						having count(mid)>=2)
						
3.2						
select eid, name from employee
	where eid not in (select manger.eid from manager)
	
	
3.3
select m.mid from manager m, employee e
	where e.eid = m.eid and e.name = 'Alice'