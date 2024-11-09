USE mintclassics;
/*Analyze Stock Levels by Category and Warehouse
This query will show stock levels for each product category by warehouse, 
helping to identify categories with high stock that may benefit from reorganization or 
reduction.
*/
SELECT w.warehouseCode, w.warehouseName, p.productLine, SUM(p.quantityInStock) AS total_stock
FROM products p
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY w.warehouseCode, p.productLine
ORDER BY total_stock DESC;
