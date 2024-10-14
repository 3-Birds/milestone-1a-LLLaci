/*
Question 1: Total Orders Per Customer

Write a query to display the total number of orders placed by each customer, 
along with their name and the date they joined. Sort the results by the total number of orders in descending order.
*/

SELECT Customers.customer_name AS "Customer's name",
    Customers.join_date AS "Date they joined",
    count(Orders.order_id) AS "Count of orders"
FROM Customers
JOIN Orders ON Orders.customer_id = Customers.customer_id
GROUP BY Customers.customer_name, Customers.join_date
ORDER BY "Count of orders" DESC;

/*
Question 2: Rank Customers by Spending

For each customer, calculate their total spending (sum of the total amounts from the `Orders` table) 
and rank them by total spending within their respective country. 
Use a **window function** to rank the customers.
*/

SELECT 
    rank() OVER (PARTITION BY country ORDER BY "Total spending" DESC),
    *
FROM
    (SELECT Customers.customer_name,
        Customers.country,
        sum(OrderItems.quantity * OrderItems.price) As "Total spending"
    FROM customers
    JOIN Orders ON Orders.customer_id = Customers.customer_id
    JOIN OrderItems ON Orderitems.order_id = Orders.order_id
    GROUP BY Customers.customer_name,Customers.country) Spendings;
