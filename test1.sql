/* question 1 - how much money does the company sell? */

SELECT 
sum(UnitPrice) AS "Total Sales Amount" 
FROM SalesTable





/* question 2 - how many distinct number of customers did buy products from this company? */

SELECT 
COUNT(DISTINCT Customer) AS Number_Of_Our_Distinct_Customers
FROM SalesTable







/* question 3 - how many and how much money did the company sell products? */

SELECT st.Product As Product , st.UnitPrice as UnitPrice, sum(st.Quantity) as quantity, (st.unitPrice * sum(st.quantity)) as total 
FROM SalesTable AS st join ProductInfo AS sp
ON st.Product = sp.Product 
Group By st.Product , st.unitprice
ORDER BY Product ASC






/* question 4 - list of customers who purchased more than 1500 just in one factor and show details */

SELECT
  Customer,
  COUNT(*) AS TotalPurchases,
  SUM(quantity) AS TotalProducts,
  SUM(quantity * unitPrice) AS TotalAmount
FROM
  salesTable
GROUP BY
  customer
HAVING
  SUM(quantity * unitPrice) > 1500;







/* question 5 - calculate total sells and its profit */

select  sum(forosh - soodforosh) AS kharide_kol,
		sum(forosh) AS foroshe_kol,
		sum(soodforosh) AS soode_kol,
		((cast(sum(soodforosh) AS FLOAT) / cast(sum(forosh - soodforosh) AS FLOAT)) * 100) AS darsasde_soode_kol
FROM (
	SELECT  (st.quantity * st.unitprice) AS forosh,
			(st.quantity * st.unitprice * sp.ProfitRatio)/100 AS soodForosh 
	FROM SalesTable AS st join ProductInfo AS sp ON st.Product = sp.Product
	) 
AS soodtable






/* question 6 - number of customares grouped by day */

select 
sum(Distinct_Customer_Numbers_Of_Each_Day) as total_customers 
from 
(
select count(distinct customer) AS Distinct_Customer_Numbers_Of_Each_Day , date from salestable group by date
)
as DailyCusotomerReport




