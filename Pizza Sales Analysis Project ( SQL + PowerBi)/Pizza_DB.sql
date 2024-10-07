select * from pizza_sales;

SELECT SUM(total_price) AS Total_Revenue from pizza_sales;

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value from pizza_sales;

SELECT SUM(quantity) AS Total_Pizza_Sold from pizza_sales;

SELECT COUNT(DISTINCT order_id ) AS Total_orders from pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order from pizza_sales;

SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders DESC;

SELECT pizza_category,SUM(total_price) as Total_price, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS PCT
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

SELECT pizza_size,CAST(SUM(total_price) AS DECIMAL(10,2)) as Total_price, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(quarter, order_date) = 1 ) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
WHERE DATEPART(quarter, order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC;

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders 