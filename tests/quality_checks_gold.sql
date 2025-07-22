/*
*************************************************************************************
Quality Checks
*************************************************************************************
Script Purpose:
   This script performs quakity checks to validate the integrity, consistency, 
   and accuracy of the gold layer. These checks ensure :
   - Uniqueness of surrogate keys in dim tables.ull or duplicate primary keys
   - Referential integrity beetween fact and dimensions tables.
   - Validation of relationship in the data model for analytical purposes

Usage Notes :
  - Run these checks after data loading silver layer
  - Investigate and resolve any discrepancies found duringg the checks
***********************************************************************************
*/

-- ********************************************************************************
-- Checking 'gold.dim_customers'
-- ********************************************************************************
-- Check for uniqueness of customer key in gold.dim_customers
-- Expectation : No result
SELECT
  customer_key,
  COUNT(*) AS duplicate count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1


-- ********************************************************************************
-- Checking 'gold.product_key
-- ********************************************************************************
-- Check for uniqueness of product key in gold.dim_products
-- Expectation : No result
SELECT
  product_key,
  COUNT(*) AS duplicate count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1

-- ********************************************************************************
-- Checking 'gold.fact_sales
-- ********************************************************************************
-- Check for the data connectivvity between fact and dimensions
SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE c.customer_key IS NULL OR p.product_key IS NULL
