-- show all the records from date and transactions table
SELECT * FROM date;
select * from transactions;

-- show transactions records in 2020 join by date table
select * from sales.date inner join sales.transactions
on sales.transactions.order_date=sales.date.date where sales.date.year=2020;

-- show total revenue in the year 2020
select sum(transactions.sales_amount) from sales.date inner join sales.transactions
on sales.transactions.order_date=sales.date.date where sales.date.year=2020;

-- show total revenue in chennai in the year 2020
 select sum(transactions.sales_amount) from sales.date inner join sales.transactions
on sales.transactions.order_date=sales.date.date where sales.date.year=2020 and market_code="Mark001";

select distinct(currency) from transactions;
-- we find duplicates of USD and INR
select count(*) from sales.date inner join sales.transactions
on sales.transactions.order_date=sales.date.date where transactions.currency="INR";

select count(*) from sales.date inner join sales.transactions
on sales.transactions.order_date=sales.date.date where transactions.currency="INR\r";
-- "INR" has 279 records while "INR\r" has 15000 records so "INR" can be considered as bad data and  finally we will keep data with "INR/r" and "USD/r"-

-- show total revenue in the year 2020 in january month
select sum(transactions.sales_amount) from sales.date inner join sales.transactions
on sales.transactions.order_date=sales.date.date where sales.date.year=2020and date.month_name="january" and  (transactions.currency="INR\r" or transactions.currency="USD\r");
