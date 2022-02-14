/*Task 1*/

/*Question 1 */
SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name
FROM vendors
ORDER BY vendor_contact_last_name ,vendor_contact_first_name ASC;

/*Question 2 */
SELECT CONCAT(vendor_contact_last_name, ', ' ,vendor_contact_first_name) AS full_name
FROM vendors
WHERE vendor_contact_last_name LIKE 'A%' OR vendor_contact_last_name LIKE 'B%' OR vendor_contact_last_name LIKE 'C%' OR vendor_contact_last_name LIKE 'E%'
ORDER BY vendor_contact_last_name ASC;

/*Question 3 */
SELECT invoice_due_date AS Due_Date, invoice_total AS Invoice_Total, ROUND(invoice_total * 0.1) AS "10%", ROUND(invoice_total + (invoice_total * 0.1) ) AS Plus10 
FROM invoices
WHERE invoice_total >= 500 AND invoice_total <= 1000
ORDER BY invoice_due_date DESC;

 /*Question 4 */
 SELECT invoice_number, invoice_total, ROUND(payment_total + credit_total) AS payment_credit_total, ROUND(invoice_total - (payment_total + credit_total)) AS balance_due
 FROM invoices
 WHERE ROUND(invoice_total - (payment_total + credit_total)) > 50
 ORDER BY balance_due DESC
 LIMIT 5;
 
 /*Question 5 */
 SELECT invoice_number, invoice_date, ROUND(invoice_total - (payment_total + credit_total)) AS balance_due, payment_date
 FROM invoices
 WHERE payment_date IS NULL;
 
 /*Question 6 */
 SELECT DATE_FORMAT(NOW(), '%m/%d/%Y') AS 'CURRENT_DATE';
 
 /*Question 7 */
 SELECT 50000 AS starting_principal, ROUND(0.065*50000) AS interest, ROUND(50000 + (0.065*50000)) AS principal_plus_interest;
 
 /*TASK 2*/
 /*Question 1*/
SELECT product_code, product_name, list_price,discount_percent
FROM Products
ORDER BY list_price DESC;
 
 /*Question 2*/
SELECT product_name,date_added,list_price
FROM products
WHERE 500<list_price AND list_price<2000
ORDER BY  date_added DESC;
 
 /*Question 3*/
 SELECT item_id,item_price,discount_amount, quantity, 
ROUND(item_price*quantity) as price_total, discount_amount*quantity as discount_total,
ROUND(item_price - discount_amount) * quantity as item_total
FROM order_items
WHERE (item_price - discount_amount) * quantity>500
ORDER BY (item_price - discount_amount) * quantity DESC;

/*Question 4*/
SELECT order_id,order_date,ship_date
FROM orders
WHERE ship_date IS NULL;

/*Question 5*/
SELECT 100 AS "price",0.07 AS "tax_rate", 100 * 0.07 AS "tax_amount",
100 + 0.07 * 100 AS "total";
