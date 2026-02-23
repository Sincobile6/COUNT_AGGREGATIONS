
--Lesson 10 – Aggregations (COUNT, SUM, AVG, GROUP BY)
--SECTION 1 – COUNT Aggregations (10 Questions)
--1. How many total properties are in the database?

select count(*) as Total_Properties 
from [housing_data].[dbo].[housingdata]

select count([property_id]) as Total_Properties 
from [housing_data].[dbo].[housingdata]

--2. How many properties are listed in each province?

select [province], count([PROVINCE]) 
AS  No_of_properties from[housing_data].[dbo].[housingdata]
GROUP BY [PROVINCE]
--3. How many properties are listed in each city?
select [CITY], count([CITY]) 
AS  No_of_properties from[housing_data].[dbo].[housingdata]
GROUP BY [CITY]

--4. How many properties have more than 2 bedrooms?
select [bedrooms], count([bedrooms]) 
AS  No_of_properties from[housing_data].[dbo].[housingdata]
where bedrooms > 2
GROUP BY [bedrooms]

--5. How many properties have 2 or more bathrooms?
select [bathrooms], count([bathrooms]) 
AS  No_of_properties from[housing_data].[dbo].[housingdata]
where bathrooms >= 2
GROUP BY [bathrooms]

--6. How many properties have parking for at least 2 cars?
select [parking], count([parking]) 
AS  No_of_properties from[housing_data].[dbo].[housingdata]
where parking >= 2
GROUP BY [parking]
--7. How many properties are priced above R3,000,000?
select count([property_id]) as Total_Properties 
from [housing_data].[dbo].[housingdata]
where property_price > 3000000
--8. How many properties are in Gauteng?
select [PROVINCE], count(PROVINCE) 
AS  No_of_properties from[housing_data].[dbo].[housingdata]
where PROVINCE= 'GAUTENG'
GROUP BY [PROVINCE]
--9. How many properties per province have floor size greater than 200?
select [FLOOR_SIZE],([PROVINCE]), 
count(FLOOR_SIZE) 
AS NO_OF_PROPERTIES from[housing_data].[dbo].[housingdata]
where FLOOR_SIZE > 200
GROUP BY [PROVINCE]

SELECT [province], COUNT(*) AS property_count
FROM [housing_data].[dbo].[housingdata]
WHERE floor_size > 200
GROUP BY [province]
ORDER BY property_count DESC
--10. How many distinct provinces are in the table?
SELECT DISTINCT [PROVINCE] COUNT([PROVINCE]) AS 
FROM [housing_data].[dbo].[housingdata]

SELECT COUNT (DISTINCT province) AS distinct_province_count
FROM [housing_data].[dbo].[housingdata]

--SECTION 2 – SUM Aggregations (10 Questions)
--11. What is the total value of all properties combined?

 select sum(property_price) as Total_Property_value
from [housing_data].[dbo].[housingdata] group by property_price 

--12. What is the total property value per province?

select [province] sum(property_price)
as total_property_value
partition by province from [housing_data].[dbo].[housingdata]  order by property_price asc

--13. What is the total property value per city?

select [city] sum(property_price) as Total_Property_price partition by city
from [housing_data].[dbo].[housingdata] 
group by city 
--14. What is the total monthly repayment for all properties?
select sum(monthly_repayment) as total_property_value
from [housing_data].[dbo].[housingdata] 
group by monthly_repayment 

--15. What is the total monthly repayment per province?
select [province] sum(monthly_repayment)
--16. What is the total once-off cost for all properties?
select sum(monthly_repayment) as total_property_value
from [housing_data].[dbo].[housingdata] 
group by monthly_repayment
--17. What is the total once-off cost per province?
select [province] sum (total_once_off_cost) as total_property_value
from [housing_data].[dbo].[housingdata] group by province 
--18. What is the total property value for Gauteng?
select sum(property_price) as total_property_value
from [housing_data].[dbo].[housingdata] where province= 'gauteng' 
group by property_price
--19. What is the total property value for properties priced above R4,000,000?
select sum(property_price) as total_property_value
from [housing_data].[dbo].[housingdata] where province= 'gauteng' 
group by property_price
--20. What is the total minimum gross monthly income required per province?
select sum(property_price) as total_property_value
from [housing_data].[dbo].[housingdata] where province= 'gauteng' 
group by property_price
--SECTION 3 – AVG Aggregations (10 Questions)
--21. What is the average property price overall?
select avg(property_price) as Total_Property_value
from [housing_data].[dbo].[housingdata] group by property_price 
--22. What is the average property price per province?
select avg(property_price) as total_property_value
from [housing_data].[dbo].[housingdata] group by province
--23. What is the average property price per city?
select avg(property_price) as total_property_value
from [housing_data].[dbo].[housingdata] group by city
--24. What is the average number of bedrooms per province?
select avg(bedrooms) as average_bedrooms
from [housing_data].[dbo].[housingdata] group by province
--25. What is the average number of bathrooms per province?
select [province] avg(bathrooms) as average_bathrooms
from [housing_data].[dbo].[housingdata]group by bathrooms order by province
--26. What is the average floor size per province?
select [province] avg(floor_size) as average_floor_size 
from [housing_data].[dbo].[housingdata] group by province
--27. What is the average monthly repayment per province?
select [province] avg(monthly_repayment) as average_monthly_repayment 
from [housing_data].[dbo].[housingdata] group by province
--28. What is the average once-off cost per province?
select [province] avg(total_once_off_cost) as average_total_once_off_cost 
from [housing_data].[dbo].[housingdata] group by province
--29. What is the average minimum gross monthly income per province?
select [province] avg(minimum_gross_monthly_income) as average_minimum_gross_monthly_income
from [housing_data].[dbo].[housingdata] group by province
--30. What is the average property price for properties above R3,000,000?
select avg(property_price) as total_property_value
from [housing_data].[dbo].[housingdata] where [property price] > 3000000 
group by property_price 
--SECTION 4 – GROUP BY + Filtering (10 Questions)
--31. Which province has the highest average property price?
--32. Which province has the lowest average property price?
--33. Which city has the highest total property value?
--34. Which city has the lowest average property price?
--35. How many properties per province are priced above R2,000,000?
--36. What is the average floor size per province for properties above R3,000,000?
--37. What is the total property value per province for properties with 3 or more bedrooms?
--38. What is the average monthly repayment per province for properties above R4,000,000?
--39. How many properties per city have parking for 2 or more cars?
--40. What is the average minimum gross monthly income per province for properties above R5,000,000?


