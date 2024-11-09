USE mintclassics;
/* Analyze Product Turnover Rates
To identify slow-moving inventory, we can calculate the total quantity sold for each product
 over the past year. Products with low sales could be candidates for inventory reduction.
*/
SELECT p.productCode, p.productName, SUM(od.quantityOrdered) AS total_sales_last_year
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
LEFT JOIN orders o ON od.orderNumber = o.orderNumber
WHERE o.orderDate BETWEEN '2004-05-31' AND '2005-05-31'
GROUP BY p.productCode
ORDER BY total_sales_last_year ASC;
