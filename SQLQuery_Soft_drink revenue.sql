SELECT *
  FROM [master].[dbo].[Soft drink data_1]
 

--the different retailers
 SELECT distinct(retailer)
  FROM [master].[dbo].[Soft drink data_1]

---------------------------------------------------------------------------------------------------------------------------------------------------------
  -- the different retailers and and total revenue by different units units sold

  SELECT units_sold, price_per_unit, (price_per_unit*units_sold) as Revenue
  FROM [master].[dbo].[Soft drink data_1] 
  --order by 1, 2 desc
  group by units_sold, price_per_unit

 alter table [master].[dbo].[Soft drink data_1]
 add Revenue INT

 update [master].[dbo].[Soft drink data_1]
 set Revenue = (price_per_unit*units_sold)

 

 --overall revenue
 select sum(Revenue) as Gross_Revenue
 from [master].[dbo].[Soft drink data_1]

 --total revenue by retailer #BevCo

 select sum(Revenue) as Gross_Revenue_Bevco
 from [master].[dbo].[Soft drink data_1]
 where retailer = 'bevco'

 --total revenue by retailer #DreamCo

 select sum(Revenue) as Gross_Revenue
 from [master].[dbo].[Soft drink data_1]
 where retailer = 'DreamCo' 
 
 --total revenue by retailer #FizzySip

 select sum(Revenue) as Gross_Revenue
 from [master].[dbo].[Soft drink data_1]
 where retailer = 'FizzySip'

 --total revenue by retailer #Sodapop

 select sum(Revenue) as Gross_Revenue
 from [master].[dbo].[Soft drink data_1]
 where retailer = 'sodapop'

 ---------------------------------------------------------------------------------------------------------------------------------------------------------
 --splitting the month from the year

 select date,
 PARSENAME(REPLACE(date, '-', '.'), 2)
 FROM [master].[dbo].[Soft drink data_1]
 group by date
 order by 2

 alter table [master].[dbo].[Soft drink data_1]
 add Month INT

 update [master].[dbo].[Soft drink data_1]
 set Month = PARSENAME(REPLACE(date, '-', '.'), 2)

 
 
 ---------------------------------------------------------------------------------------------------------------------------------------------------------

 --revenue over the year

 select date, sum(Revenue) as Revenue_over_year
 from [master].[dbo].[Soft drink data_1]
 group by date
  
 -- revenue over the year vs retailer
 
 select retailer, date, sum(Revenue) as RevenueVsYearVsRetailer
 from [master].[dbo].[Soft drink data_1]
 group by date, Retailer
 

 --monthly revenue

 select retailer, month, sum(Revenue) as Monthly_Revenue
 from [master].[dbo].[Soft drink data_1]
 group by month, Retailer
 order by 1, 2

 --overall monthly revenue for combined retailers
 
 select month, sum(Revenue) as Monthly_Revenue
 from [master].[dbo].[Soft drink data_1]
 group by month
 order by 1, 2

 --monthly quantity target 

 select month, sum(Units_Sold) as Monthly_units
 from [master].[dbo].[Soft drink data_1]
 group by month
 order by 1, 2

 --monthly quantity target vs retailer

 select retailer,month, sum(Units_Sold) as Monthly_units_by_Retailer
 from [master].[dbo].[Soft drink data_1]
 group by retailer, month
 order by 1, 2

 --monthly average price target

 select month, avg(Price_per_Unit) as Monthly_Average_Price
 from [master].[dbo].[Soft drink data_1]
 group by  month
 order by 1

 
 --monthly average price target vs retailer

 select Retailer, month, avg(Price_per_Unit) as MonthlyAveragePriceVsRetailer
 from [master].[dbo].[Soft drink data_1]
 group by  Retailer,month
 order by 1, 2

  

 