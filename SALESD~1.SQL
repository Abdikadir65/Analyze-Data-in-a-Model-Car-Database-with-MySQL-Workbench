USE mintclassics;
/*Sales Distribution by Product and Category
To understand demand distribution, we can analyze total sales by product line (category). Products with high demand should be prioritized for stocking, while low-demand items could be reduced or consolidated.
*/
SELECT p.productLine, p.productCode, p.productName, SUM(od.quantityOrdered) AS total_sales
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
LEFT JOIN orders o ON od.orderNumber = o.orderNumber
WHERE o.orderDate BETWEEN '2004-05-31' AND '2005-05-31'
GROUP BY p.productLine, p.productCode
ORDER BY total_sales DESC;
