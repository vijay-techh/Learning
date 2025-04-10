select * from dbo.Sales

select max(quantity) [maximum quantity]from dbo.Sales
select min(quantity) [minimum quantity]from dbo.Sales
select sum(quantity) [sum of quantity] from dbo.Sales
select avg(quantity) [average of quantity] from dbo.Sales
select count(*) from dbo.Sales


select productid,sum(totalamount) [maximum quantity]from dbo.Sales
where not productid = 1 
group by productid
