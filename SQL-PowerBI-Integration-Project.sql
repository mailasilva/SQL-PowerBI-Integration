--Integration SQL - Power BI

-- 3. Project:

-- Overview Tab

-- i) Total Revenue
-- ii) Total Orders
-- iii) Total product categories
-- iv) Total Clients
-- v) Total Revenue and Profit by Month
-- vi) Profit Margin
-- vii) Orders by Month
-- viii) Profit by Country

-- Clients Tab

-- i) Orders by COuntry
-- ii) Clients by Country
-- iii) Sales by Gender
-- iv) Sales by Region



-- 4. Tables and colunms to be used: 

-- Tables

SELECT * FROM FactInternetSales
SELECT * FROM DimProductCategory
SELECT * FROM DimCustomer
SELECT * FROM DimGeography


-- Columns
 
-- SalesOrderNumber                    (FactInternetSales)
-- OrderDate                           (FactInternetSales)
-- EnglishProductCategoryName          (DimProductCategory) ****
-- CustomerKey                         (DimCustomer)
-- FirstName + ' ' + LastName          (DimCustomer)
-- Gender                              (DimCustomer)
-- EnglishCountryRegionName            (DimGeography)
-- OrderQuantity                       (FactInternetSales)
-- SalesAmount                         (FactInternetSales)
-- TotalProductCost                    (FactInternetSales)
-- SalesAmount - TotalProductCost      (FactInternetSales)



-- 5. Creating View RESULTADOS_ADW

CREATE OR ALTER VIEW RESULTADOS_ADW AS
SELECT
	fis.SalesOrderNumber AS 'Order_Number',
	fis.OrderDate AS 'Order_Date',
	dpc.EnglishProductCategoryName AS 'Product Category',
	fis.CustomerKey AS 'Client_ID',
	dc.FirstName + ' ' + dc.LastName AS 'Client_Name',
	REPLACE(REPLACE(dc.Gender, 'M', 'Male'), 'F', 'Female') AS 'Gender',
	dg.EnglishCountryRegionName AS 'Country',
	fis.OrderQuantity AS 'Sales_Qty',
	fis.SalesAmount AS 'Sales_Amount',
	fis.TotalProductCost AS 'Sales_Cost',
	fis.SalesAmount - fis.TotalProductCost AS 'Sales_Profit'
FROM FactInternetSales fis
INNER JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
	INNER JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
		INNER JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
	INNER JOIN DimGeography dg ON dc.GeographyKey = dg.GeographyKey







