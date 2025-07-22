Data Dictionary for Gold Layer

Overview

The Gold Layer is the business level data representation structured to support analytical and reporting use cases. it consists of dimension tables and fact tables for specific business metrics.

1- gold.dim_customers

. Purpose : Stores customer details enriched with demographic and geographic data
. Columns :

Column Name    Data Type                     Description

customer_key      INT     Surrogate key uniquely identifying each customer record in the dim table
customer_id       INT     Unique numerical identifier assigned to each customer
customer_number   NVARCHAR(50)  Alfanumeric identifier for tracking and referencing the customer
first_name        NVARCHAR(50)  The customer's first name, as recorded in the system
first_name        NVARCHAR(50)  The customer's last name, as recorded in the system
country           NVARCHAR(50)  The country of residence for the customer (e.g., France)
country           NVARCHAR(50)  The marital status of the customer (e.g., 'Married', 'Single')
gender            NVARCHAR(50)  The gender of the customer (e.g., 'Male', 'Female')
birthdate         DATE     The date of birth of the customer, formatted as YYYY-MM-DD
create_date       DATE     The date and time when the customer record was created in the system


2- gold.dim_products

. Purpose : provides information about the products and their attributes
. Columns :

Column Name    Data Type                     Description

product_key      INT     Surrogate key uniquely identifying each product record in the dim table
product_id       INT     Unique identifier assigned to the product for tracking and referencing
product_number   NVARCHAR(50)  Alfanumeric identifier for tracking and referencing the product
product_name     NVARCHAR(50)  The product's descriptive name, as recorded in the system
first_name       NVARCHAR(50)  The customer's last name, as recorded in the system
category_id      NVARCHAR(50)  Unique identifier assigned to the product's category
category         NVARCHAR(50)  The broader classification of the product
subcategory      NVARCHAR(50)  a more detailed classification of the product within the category
maintenance      NVARCHAR(50)  Indicates whether the product requires maintenance
cost             INT      The cost or base price of the product, in monetary units
product_line     NVARCHAR(50) specific product line or series to which the product belongs
start_date       DATE   The date when the product was available for sale or use, in the store

3- gold.fact_sales

. Purpose : Stores transactional sales data for analytical purposes
. Columns :

Column Name    Data Type                     Description

order_number      NVARCHAR(50) unique alfanumeric identifier for each sales order 
product_key       INT     Surrogate key linking the order to the product dim table
customer_key      INT     Surrogate key linking the order to the customer dim table
order_date        DATE   The date when the order was placed
shipping_date     DATE   The date when the order was shipped to the customer
due_date          DATE   The date when the order payment was due
sales_amount      INT    The total monetary value of the sale for the line item
quantity          INT    The number of units of the product ordered for the line item
price             INT    The price per unit of the product for the line item, in currency units
