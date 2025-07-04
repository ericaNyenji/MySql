Inventory Management System (SQL Project)

This is a SQL-based Inventory Management System designed to track products, suppliers, stock levels, and purchase orders. 
The database simulates a basic inventory system for a small business or warehouse.

## Technologies Used

- MySQL (works with PostgreSQL/Oracle with minor syntax tweaks)
- SQL (DDL & DML)

## Tables
-`products`: Product catalog
- `suppliers`: Supplier information
- `stock`: Current stock per product
- `orders`: Purchase orders made to suppliers
- `order_items`: Items per purchase order

## Schema Overview

- A product can have one supplier
- Each order can include multiple products
- Stock is updated per product based on orders

##  Sample Queries Included
- Low-stock alert
- Total stock by category
- Orders placed within a date range
- Top suppliers by number of orders

## How to Run

1. Clone this repo
2. Import `schema.sql` into your database
3. Run `seed_data.sql` to populate with test data
4. Use `queries.sql` to explore functionality

##  Author
Erica Mary Nyenji  
Email: nyenjierica@gmail.com  
LinkedIn: https://www.linkedin.com/in/erica-mary-nyenji-ba3686267/
