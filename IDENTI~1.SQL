USE mintclassics;

/*Identify Redundant Storage Across Warehouses
This query identifies products stored in multiple warehouses, indicating potential redundancy. Consolidating these items might save space.
*/
SELECT p.productCode, p.productName, COUNT(DISTINCT w.warehouseCode) AS warehouse_count
FROM products p
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY p.productCode
HAVING warehouse_count > 1
ORDER BY warehouse_count DESC;
