# Aldiwan Restaurant Database

**Course:** CIS235 - Database Management  
**University:** Imam Abdulrahman Bin Faisal University  
**Database:** MySQL

---

## Project Overview

A relational database system for Aldiwan Restaurant, designed to manage employees, menu items, orders, customers, inventory, and payments. The system supports two user roles — Manager and User — each with distinct privileges.

---

## Database Schema

The database `aldiwandb` consists of 7 tables:

| Table | Description |
|-------|-------------|
| `person` | System users (Manager and User roles) |
| `customer` | Customer information |
| `menu_items` | Available menu items and prices |
| `orders` | Customer orders linked to users and menu items |
| `takeaway` | Delivery orders with customer address and fees |
| `paycredit` | Credit card payment records |
| `inventoryitem` | Kitchen inventory managed by staff |

---

## Entity Relationships

- Person → Orders: One-to-Many (a user can place multiple orders)
- Person → Inventory: One-to-Many (a manager manages multiple inventory items)
- Orders → Menu Items: One-to-Many (an order references a menu item)
- TakeAway → Orders: One-to-Many
- Customer → PayCredit: One-to-One

---

## SQL Features Implemented

- DDL: `CREATE TABLE` with primary and foreign key constraints
- DML: `INSERT`, `UPDATE`, `DELETE` on base and related tables
- Queries: `UNION`, `JOIN`, `LEFT JOIN`, `INNER JOIN`
- Aggregate functions: `SUM`, `MIN`, `MAX`, `AVG`, `COUNT`
- Clauses: `GROUP BY`, `ORDER BY`, `HAVING`, `BETWEEN`, `IN`, `DISTINCT`, `CASE`
- Views: `CustomerOrdersSummary`, `InventoryReorderList`
- Stored Procedures: `CalculateTotalRevenue()`, `UpdateInventoryItemPrice(item_id, new_price)`

---

## How to Run

1. Install [MySQL Workbench](https://www.mysql.com/products/workbench/)
2. Open `CIS235-_Restaurant_Database_Project_SQL_r.sql`
3. Run the script — it will create the database, tables, and insert sample data
4. All queries and stored procedures are included at the end of the file

---

## Author

**Razan Alqahtani**  
Computer Science Student — IAU
