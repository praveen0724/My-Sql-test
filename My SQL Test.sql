#create database praveen;
#use praveen;
select purch_amt from orders order by purch_amt desc
limit 1
offset 4;
#Question 1
SELECT Customer.cust_name AS "Customer",
customer.grade AS "Grade",orders.ord_no AS "Order No."
FROM orders, salesman, customer
WHERE orders.customer_id = customer.ï»¿custemor_id
AND orders.salesman_id = salesman.salesman_id
AND salesman.city IS NOT NULL
AND customer.grade IS NOT NULL;

# Question 2

SELECT ord_no, purch_amt, ord_date, salesman_id 
FROM orders 
WHERE salesman_id IN(
SELECT salesman_id 
FROM salesman
WHERE commision = (
SELECT MAX(commision) 
FROM salesman));

#Question 3

SELECT ord_no, purch_amt, ord_date, salesman_id
FROM orders
WHERE salesman_id IN (
SELECT salesman_id
FROM salesman WHERE city='nagpur');

#Question 4

SELECT ord_date, SUM(purch_amt), 
SUM(purch_amt)*.15 
FROM orders 
GROUP BY ord_date 
ORDER BY ord_date;

#Question 5

SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders
WHERE purch_amt >(SELECT  AVG(purch_amt) FROM orders);

# Question 6

SELECT purch_amt FROM orders ORDER BY purch_amt DESC LIMIT 4, 1;

#Question 7

Entity:
 An entity can be a real-world object, either tangible or intangible,
that can be easily identifiable. For example, in a college database,
students, professors, workers, departments, and projects can be
referred to as entities. Each entity has some associated properties
that provide it an identity.

Relationships:
Relations or links between entities that have something to do with each other.
For example - The employees table in a companys database can be associated with
the salary table in the same database.

#Question 8

SELECT customer_id , 
bank_account_details.account_number, CASE 
WHEN ifnull(balance_amount,0) = 0 THEN 
Transaction_amount ELSE balance_amount END AS 
balance_amount
FROM bank_account_details INNER 
JOIN bank_account_transaction ON 
bank_account_details.account_number = bank_account_transaction.account_number
AND account_type = "Credit Card";

#Question 9

SELECT bank_account_details.account_number, balance_amount, transaction_amount
FROM bank_account_details INNER JOIN bank_account_transaction ON bank_account_details.account_number = bank_account_transaction.account_number
AND (date_format(Transaction_Date , '%Y-%m')  BETWEEN "2020-03" AND "2020-04");

#Question 10

SELECT bank_account_details.customer_id, bank_account_details.account_number, balance_amount, transaction_amount
FROM bank_account_details LEFT JOIN bank_account_transaction ON bank_account_details.account_number = bank_account_transaction.account_number
LEFT JOIN bank_customer ON bank_account_details.customer_id = bank_customer.customer_id
AND NOT ( date_format(Transaction_Date , '%Y-%m') = "2020-03" );