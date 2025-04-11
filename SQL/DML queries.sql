--where clause
select * from dbo.sales
where totalamount>=200

--order by clause
select * from dbo.sales
order by productid

--group by clause
select productid, sum(totalamount) from dbo.sales
group by productid

--insert  clause

insert into dbo.sales
values(1,'2023-08-03',20,300,343,1,2,'cash',100)


--update clause

update dbo.sales
set paymentmethod = 'unknown'
where PaymentMethod is null


--delete clause
delete sales 
where productid is null

--having clause
