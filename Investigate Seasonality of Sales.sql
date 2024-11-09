USE mintclassics;

/*Investigate Seasonality of Sales
Analyzing sales by month over the past year can reveal seasonal demand patterns, which can guide stocking decisions.
*/
SELECT MONTH(o.orderDate) AS sale_month, p.productLine, SUM(od.quantityOrdered) AS monthly_sales
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
WHERE o.orderDate BETWEEN '2004-05-31' AND '2005-05-31'
GROUP BY sale_month, p.productLine
ORDER BY sale_month, monthly_sales DESC;
