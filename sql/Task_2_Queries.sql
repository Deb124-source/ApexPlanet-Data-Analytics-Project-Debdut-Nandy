
-- ============================================================
-- ApexPlanet Data Analytics Internship
-- Task 2: SQL for Data Extraction
-- Dataset: E-Commerce Sales
-- ============================================================


-- ============================================================
-- SQL FUNDAMENTALS
-- ============================================================

-- 1. Select specific columns
SELECT InvoiceNo, Description, Quantity, UnitPrice, SalesAmount
FROM online_retail
LIMIT 10;


-- 2. Filter transactions
SELECT InvoiceNo, Description, Quantity, SalesAmount
FROM online_retail
WHERE Quantity > 100
LIMIT 20;


-- 3. Sort transactions by sales
SELECT InvoiceNo, Description, Quantity, SalesAmount
FROM online_retail
ORDER BY SalesAmount DESC
LIMIT 10;


-- 4. Find unique countries
SELECT DISTINCT Country
FROM online_retail
ORDER BY Country;


-- 5. Count total transactions
SELECT COUNT(*) AS TotalTransactions
FROM online_retail;


-- 6. Total sales by country
SELECT
    Country,
    SUM(SalesAmount) AS TotalSales
FROM online_retail
GROUP BY Country
ORDER BY TotalSales DESC;


-- 7. Countries with sales greater than £10,000
SELECT
    Country,
    SUM(SalesAmount) AS TotalSales
FROM online_retail
GROUP BY Country
HAVING SUM(SalesAmount) > 10000
ORDER BY TotalSales DESC;


-- 8. Overall sales statistics
SELECT
    COUNT(DISTINCT InvoiceNo) AS TotalOrders,
    COUNT(DISTINCT StockCode) AS UniqueProducts,
    SUM(Quantity) AS TotalQuantity,
    SUM(SalesAmount) AS TotalSales,
    AVG(SalesAmount) AS AverageTransactionValue,
    MIN(SalesAmount) AS MinimumSale,
    MAX(SalesAmount) AS MaximumSale
FROM online_retail;


-- 9. Top 10 products by sales
SELECT
    Description,
    SUM(Quantity) AS TotalQuantity,
    SUM(SalesAmount) AS TotalSales
FROM online_retail
GROUP BY Description
ORDER BY TotalSales DESC
LIMIT 10;


-- 10. Monthly sales
SELECT
    strftime('%Y-%m', InvoiceDate) AS YearMonth,
    SUM(SalesAmount) AS TotalSales
FROM online_retail
GROUP BY YearMonth
ORDER BY YearMonth;


-- ============================================================
-- ADVANCED SQL
-- ============================================================

-- 11. Subquery: transactions above average sales
SELECT
    InvoiceNo,
    Description,
    Quantity,
    SalesAmount
FROM online_retail
WHERE SalesAmount > (
    SELECT AVG(SalesAmount)
    FROM online_retail
)
ORDER BY SalesAmount DESC
LIMIT 20;


-- 12. CTE: country sales above £10,000
WITH CountrySales AS (
    SELECT
        Country,
        SUM(SalesAmount) AS TotalSales
    FROM online_retail
    GROUP BY Country
)
SELECT
    Country,
    TotalSales
FROM CountrySales
WHERE TotalSales > 10000
ORDER BY TotalSales DESC;


-- 13. Window function: country sales ranking
WITH CountrySales AS (
    SELECT
        Country,
        SUM(SalesAmount) AS TotalSales
    FROM online_retail
    GROUP BY Country
)
SELECT
    Country,
    TotalSales,
    RANK() OVER (ORDER BY TotalSales DESC) AS SalesRank
FROM CountrySales
ORDER BY SalesRank;


-- 14. Window function: product sales ranking
WITH ProductSales AS (
    SELECT
        Description,
        SUM(SalesAmount) AS TotalSales
    FROM online_retail
    GROUP BY Description
)
SELECT
    Description,
    TotalSales,
    RANK() OVER (ORDER BY TotalSales DESC) AS SalesRank
FROM ProductSales
ORDER BY SalesRank
LIMIT 20;


-- 15. Create country sales view
CREATE VIEW IF NOT EXISTS country_sales AS
SELECT
    Country,
    COUNT(DISTINCT InvoiceNo) AS TotalOrders,
    SUM(Quantity) AS TotalQuantity,
    SUM(SalesAmount) AS TotalSales
FROM online_retail
GROUP BY Country;


-- View results
SELECT *
FROM country_sales
ORDER BY TotalSales DESC;


-- ============================================================
-- 10 BUSINESS QUESTIONS
-- ============================================================

-- Business Question 1:
-- What is the total revenue?
SELECT
    ROUND(SUM(SalesAmount), 2) AS TotalRevenue
FROM online_retail;


-- Business Question 2:
-- Which are the top 10 products by revenue?
SELECT
    Description,
    ROUND(SUM(SalesAmount), 2) AS TotalRevenue
FROM online_retail
GROUP BY Description
ORDER BY TotalRevenue DESC
LIMIT 10;


-- Business Question 3:
-- Which countries generate the most revenue?
SELECT
    Country,
    ROUND(SUM(SalesAmount), 2) AS TotalRevenue
FROM online_retail
GROUP BY Country
ORDER BY TotalRevenue DESC
LIMIT 10;


-- Business Question 4:
-- Which countries have the most orders?
SELECT
    Country,
    COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM online_retail
GROUP BY Country
ORDER BY TotalOrders DESC
LIMIT 10;


-- Business Question 5:
-- What are the top 10 customers by revenue?
SELECT
    CustomerID,
    ROUND(SUM(SalesAmount), 2) AS TotalRevenue
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalRevenue DESC
LIMIT 10;


-- Business Question 6:
-- What is the monthly revenue trend?
SELECT
    strftime('%Y-%m', InvoiceDate) AS YearMonth,
    ROUND(SUM(SalesAmount), 2) AS MonthlyRevenue
FROM online_retail
GROUP BY YearMonth
ORDER BY YearMonth;


-- Business Question 7:
-- Which products have the highest quantity sold?
SELECT
    Description,
    SUM(Quantity) AS TotalQuantitySold
FROM online_retail
GROUP BY Description
ORDER BY TotalQuantitySold DESC
LIMIT 10;


-- Business Question 8:
-- What is the average order value?
SELECT
    ROUND(
        SUM(SalesAmount) / COUNT(DISTINCT InvoiceNo),
        2
    ) AS AverageOrderValue
FROM online_retail;


-- Business Question 9:
-- Which customers have placed the most orders?
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalOrders DESC
LIMIT 10;


-- Business Question 10:
-- Which products generate high revenue per unit?
SELECT
    Description,
    SUM(Quantity) AS TotalQuantity,
    ROUND(SUM(SalesAmount), 2) AS TotalRevenue,
    ROUND(SUM(SalesAmount) / SUM(Quantity), 2) AS RevenuePerUnit
FROM online_retail
GROUP BY Description
HAVING SUM(Quantity) > 0
ORDER BY RevenuePerUnit DESC
LIMIT 10;
