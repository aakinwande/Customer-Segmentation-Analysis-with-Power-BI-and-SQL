SELECT * FROM customer_behavior.customer_data;

-- Question 1: Identify the age and gender groups that contribute the most to sales. 
-- Insight 1: Customer Demographic Segmentation

SELECT Age, Gender, SUM(PurchaseAmount) AS TotalSpent, COUNT(CustomerID) AS NumPurchases
FROM customer_behavior.customer_data
WHERE Gender = 'Male'
GROUP BY Age, Gender
ORDER BY TotalSpent DESC;


-- Question 2: Determine which geographical locations generate the highest sales.
-- Insight 2: Geographical Trends

SELECT Location, SUM(PurchaseAmount) AS TotalSales
FROM customer_behavior.customer_data
GROUP BY Location
ORDER BY TotalSales DESC;


-- Question 3: Analyze purchasing patterns across different seasons to identify peak periods for various product categories
-- Insight 3: Seasonal Purchasing Behavior

SELECT Season, Category, SUM(PurchaseAmount) AS TotalSales
FROM customer_behavior.customer_data
GROUP BY Season, Category
ORDER BY TotalSales DESC;


-- Question 4:  Identify the most popular product categories among customers.
-- Insight 4: Product Category Preferences

SELECT Category, SUM(PurchaseAmount) AS TotalSales
FROM customer_behavior.customer_data
GROUP BY Category
ORDER BY TotalSales DESC;

-- Question 5: Determine the customers with the highest purchase amounts and frequency of purchases.
-- Insight 5: High-Value Customers

SELECT CustomerID, SUM(PurchaseAmount) AS TotalSpent, COUNT(FrequencyOfPurchases) AS PurchaseFrequency
FROM customer_behavior.customer_data
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 5;


-- Question 6: Evaluate the average review ratings across different product categories to gauge customer satisfaction levels.
-- Insight 6: Customer Satisfaction


SELECT Category, ROUND(AVG(ReviewRating), 2) AS AvgRating
FROM customer_behavior.customer_data
GROUP BY Category
ORDER BY AvgRating DESC;


-- Question 7:  Assess the impact of subscription status on purchasing behavior.
-- Insight 7: Subscription Impact

SELECT SubscriptionStatus, AVG(PurchaseAmount) AS AvgSpend, COUNT(CustomerID) AS NumPurchases
FROM customer_behavior.customer_data
GROUP BY SubscriptionStatus;


-- Question 8: Identify the most preferred shipping types among different customer segments.
-- Insight 8: Shipping Preferences

SELECT ShippingType, COUNT(CustomerID) AS NumPurchases, ROUND(AVG(PurchaseAmount), 2) AS AvgSpend
FROM customer_behavior.customer_data
GROUP BY ShippingType
ORDER BY NumPurchases DESC;


-- Question 9: Understand the preferred payment methods among different customer segments.
-- Insight 9: Payment Method Preferences

SELECT PaymentMethod, COUNT(CustomerID) AS NumPurchases, SUM(PurchaseAmount) AS TotalSpent
FROM customer_behavior.customer_data
GROUP BY PaymentMethod
ORDER BY NumPurchases DESC;

