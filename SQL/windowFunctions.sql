select * from students

select *, ROW_NUMBER() over(order by marks desc) as [row number] from students
--rank function
select *, rank() over(order by marks desc) as[rank]from students
-- Dense rank
select *, DENSE_RANK() over(order by marks desc) as [dense rank] from students

----------partition---------------------
select *,ROW_NUMBER() over(partition by subject order by marks desc) as [row number] from students

select *,Rank() over(partition by subject order by marks desc) as [row number] from students

select *,dense_Rank() over(partition by subject order by marks desc) as [row number] from students


