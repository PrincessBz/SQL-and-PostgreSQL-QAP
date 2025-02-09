# University Course Enrollment System & Online Store Inventory

This repository contains SQL scripts for two database management systems:
1. University Course Enrollment System**
2. Online Store Inventory and Orders System**

- 1. University Course Enrollment System
This database manages university students, professors, courses, and enrollments.

 *** Features
- Students can enroll in multiple courses.
- Professors can teach multiple courses, but each course has only one professor.
- Tracks enrollments with timestamps.

 *** Tables
- `students`: Stores student details.
- `professors`: Stores professor details.
- `courses`: Stores course details and their assigned professors.
- `enrollments`: Tracks student enrollments in courses.

*** Usage
Run the SQL scripts in PostgreSQL to create and manage the database.

---

- 2. Online Store Inventory and Orders System
This database manages products (stationery), customers, and their orders.

*** Features
- Inventory management for stationery products.
- Tracks customer orders and their ordered items.
- Updates stock quantities after purchases.

*** Tables
- `products`: Stores product details.
- `customers`: Stores customer information.
- `orders`: Stores order records.
- `order_items`: Tracks items within each order.

*** Usage
Run the SQL scripts in PostgreSQL to set up and manage the database.

---

## How to Use
1. Execute the provided SQL scripts to create tables.
2. Insert sample data to populate the tables.
3. Run queries to manage enrollments, orders, and inventory.

* Requirements
- PostgreSQL
- SQL knowledge

*** Author
Developed by Princess as part of a learning project, based on table structures provided by my instructor Mr English.
