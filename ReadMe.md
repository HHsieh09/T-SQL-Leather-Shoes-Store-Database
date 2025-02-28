# Leather Shoes Database Business Solution Project

## Overview
This project is designed to optimize business operations for a leather shoe company by implementing an advanced database application. The database integrates data from third-party ERP systems through ETL (Extract, Transform, Load) techniques, ensuring efficient and error-free processing. By leveraging T-SQL, the project enhances corporate accounting insights and streamlines operational decision-making.

## Key Features
- **Optimized Data Processing:** Utilized T-SQL to develop stored procedures that retrieve deduplicated and error-free data.
- **OLTP System Implementation:** Designed and implemented an OLTP system to manage and integrate data from third-party ERP systems.
- **Business Insights:** Developed custom analytical procedures to support actionable business insights.

## Execution Flow
The database operations rely on a structured and sequential execution of SQL scripts. It is critical to follow the correct execution order to maintain data integrity and ensure proper functionality. Below is a comprehensive breakdown of each step in the implementation process:

### 1. Import Flat Files
- **Description:** The initial step involves importing 18 flat files that serve as the primary data sources for the system. This step is crucial as all subsequent processes depend on the successful integration of these files.
- **Important Considerations:**
  - The Import Flat File application may incorrectly determine data types during import.
  - To prevent data inconsistencies, it is recommended to enable "Allow Nulls" for all columns.
  - Most ID columns should be assigned as `INT`, while non-date text-based fields should be formatted as `NVARCHAR(50)` or `VARCHAR(50)`. 
  - Specific fields such as `InventoryID` and `PromotionID` should always be designated as `VARCHAR` to ensure proper data handling.

### 2. Table Creation
- **Script:** `LeatherShoes_TableCreate.sql`
- **Purpose:** Establishes the foundational database schema by creating all necessary tables that will store transactional and reference data.
- **Process:** This step involves the execution of a stored procedure that methodically defines table structures, ensuring proper data storage, indexing, and relational integrity.

### 3. Order Data Insertion
- **Script:** `LeatherShoes_Order_TableInsert.sql`
- **Purpose:** Populates the database with order-related data, enabling the tracking and management of customer purchases.
- **Process:** The script executes a structured ETL process to transfer, validate, and store order information in the designated tables.

### 4. Inventory Purchase Data Insertion
- **Script:** `LeatherShoes_InventoryPurchaseDetail_TableInsert.sql`
- **Purpose:** Inserts detailed inventory purchase records into the database, ensuring that stock replenishment data is accurately captured.
- **Process:** This stored procedure facilitates the systematic integration of inventory purchases, linking them to suppliers, products, and order history.

### 5. Other Data Insertion
- **Script:** `LeatherShoes_Others_TableInsert.sql`
- **Purpose:** Completes the data population process by inserting supplementary business-related records that support overall system functionality.
- **Process:** The script ensures that auxiliary datasets, such as customer demographics and promotional data, are systematically integrated.

### 6. (Optional) Basic Data Insertion
- **Script:** `LeatherShoes_BasicInsert.sql`
- **Purpose:** This optional execution allows for additional manual data insertion if required.
- **Process:** Although not mandatory, executing this script may be useful in initializing default values or supplementing specific records before running analytical queries.

### 7. Frequently Purchased Items Analysis
- **Script:** `LeatherShoes_FrequentlyPurchaseTrend_Select.sql`
- **Purpose:** Extracts insights into customer purchasing trends by identifying frequently purchased items while excluding employee transactions.
- **Process:** This query-based stored procedure analyzes historical sales data to determine customer buying patterns, supporting strategic decision-making.

### 8. Employee Sales Performance Analysis
- **Script:** `LeatherShoes_EmployeeSalesPerformance_Select.sql`
- **Purpose:** Evaluates the effectiveness and efficiency of employees in driving sales.
- **Process:** This analytical query examines employee performance metrics, sales volume, and revenue contributions, providing insights for performance-based incentives and operational improvements.

### 9. Stock Identification
- **Script:** `LeatherShoes_StockIdentify_Select.sql`
- **Purpose:** Monitors current inventory levels and assesses the necessity for additional stock orders.
- **Process:** This stored procedure systematically scans inventory data, identifying potential shortages or surplus stock, and provides recommendations for replenishment.

### 10. Table Creation & ETL Execution
- **Script:** `LeatherShoes_TableCreate & ETL Execute Stored.sql`
- **Purpose:** Consolidates and executes all table creation processes alongside ETL data insertion procedures in a single step.
- **Process:** This script ensures that the entire database setup, including schema definitions and initial data population, is executed in an organized and structured manner.

### 11. Final Execution
- **Script:** `LeatherShoes_Execution.sql`
- **Purpose:** Serves as the concluding step, executing all stored procedures to complete the database implementation.
- **Process:** This script initiates all predefined business intelligence queries and ensures that the system is fully operational by integrating all processed data.

## Additional Utilities
To facilitate database maintenance and troubleshooting, the following scripts are provided:
- **Table Drop Script:** `LeatherShoes_TableDrop.sql` – Drops all created tables if re-initialization is required.
- **ETL Table Drop Script:** `LeatherShoes_ETLTableDrop.sql` – Removes all ETL-related tables to reset data processing.

## Conclusion
Following the structured execution of these steps will result in a fully functional and optimized database system tailored to meet the needs of the leather shoe company. By implementing this solution, businesses can ensure seamless inventory management, gain actionable sales insights, and drive data-driven decision-making for operational success.
