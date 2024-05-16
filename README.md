# Sales-Insights-of-AtliQ-Hardware-company-using-SQL-and-Power-BI
This project focuses on generating sales insights of India based AtliQ hardware company - A Data Analysis project.
## Problem Statement:
Sales director for this company is facing a lot of challenges is this the market is growing dynamically and sales director is facing issue in terms of tracking the sales in this dynamical growth market and he is having issues with growth of this bussiness, as overall sales was declining. 
All he wants is a simple data visualization tool which he can access on daily basis. By using such tools and technology one can make data driven decisiions which helps to increase the sales of the company. So, In this projects we will help a company make its own sales related dashboard using power BI.
### Purpose and End Result:
* To unlock sales insights that are not visible before for sales team for decision support & automate them to reduced manual time spent in data gathering.
* An automated dashboard providing quick and latest sights in order to support Data driven decision making.
#### Data Analysis using MySQL:
SQL database dump is in db_dump.sql file above. Download db_dump.sql file to your local computer.
Then the data is imported to MySQL Workbench.
Analysis of different SQL statements on data base is done.
* show all the records from date and transactions table
 ``` sql
SELECT * FROM date;
select * from transactions;
```
* show transactions records in 2020 join by date table
``` sql
select * from sales.date inner join sales.transactions
on sales.transactions.order_date=sales.date.date where sales.date.year=2020;
```
* show total revenue in the year 2020
``` sql
select sum(transactions.sales_amount) from sales.date inner join sales.transactions
on sales.transactions.order_date=sales.date.date where sales.date.year=2020;
```
* show total revenue in chennai in the year 2020
``` sql
select sum(transactions.sales_amount) from sales.date inner join sales.transactions
on sales.transactions.order_date=sales.date.date where sales.date.year=2020 and market_code="Mark001";
```
``` sql
select distinct(currency) from transactions;
```
* we find duplicates of USD and INR
``` sql
select count(*) from sales.date inner join sales.transactions
on sales.transactions.order_date=sales.date.date where transactions.currency="INR";
select count(*) from sales.date inner join sales.transactions
on sales.transactions.order_date=sales.date.date where transactions.currency="INR\r";
```
* "INR" has 279 records while "INR\r" has 15000 records so "INR" can be considered as bad data and  finally we will keep data with "INR/r" and "USD/r"-
* show total revenue in the year 2020 in january month
``` sql 
select sum(transactions.sales_amount) from sales.date inner join sales.transactions
on sales.transactions.order_date=sales.date.date where sales.date.year=2020and date.month_name="january" and  (transactions.currency="INR\r" or transactions.currency="USD\r");
```
##### Data Cleaning and ETL (Extract, Transform, Load):
In this process, we will work on data cleaning and ETL.
* Connect the MySQL database with the PowerBI desktop.
* Loading data into the Power BI deskstop. This step load all the tables and created in the data base. This load option will connect with the SQL and pull all the records into power BI environment.
* In that model view we will be looking up for model which form the star schema.
* Transform data with the help of Power Query.Power query editor is where we perform out ETL.and then we can perform data transformation i.e. Data Cleaning, Data Wrangling, Data Munging. we need to filter the rows where the values are null and filtering the data and deselecting the blank option. Negative values and also 0 values that appears in the table are filtered. Convert USD into INR in the transaction’s table. We can see some duplicate values and for analysis its better to delete anyone of them so lets delete USD and keep USD/r. finally we will keep data with INR/r and USD/r.
###### Build Dashboard using Power BI:
* Data visualization was done in Microsoft Power BI Desktop where the Revenue Trend was visualized. Total Revenue, Sales Quantity,Top 5 customers, revenue by market and revenue by sales quantity was also visualized.
* A Power BI dashboard was designed to understand AtliQ Hardware goods sales trend. The final dashboard was effective at displaying the sales trend of AtliQ Hardware, allowing user to understand the data and make informed decisions. This dashboard could help in icreasing the revenue at least by 7% in the next Quarter.
