Topic: Leather Shoes Database Business Solution Project - Advanced Database Applications

The data in this database is primarily obtained through the ETL technique, and all execution should ideally be contained within a single file. Therefore, the order in which the SQL files are executed is crucial. Below is the sequence to create tables, insert data, and query the database, with explanations of each step in this project:

1. Import Flat Files
Explain: This is the most important step. As this database relies on ETL for data acquisition, it is required to import the 18 flat files at the outset to ensure that subsequent processes function effectively.  

Notice: When importing flat files, the Import Flat File application may incorrectly identify data types. To avoid mistakes, it is advisable to "Allow Nulls" for all columns, assign the majority of ID columns as INT, and designate the non-date columns as NVARCHAR(50) or VARCHAR(50). It is important to note that InventoryID and PromotionID should be treated as VARCHAR.  

2. LeatherShoes_TableCreate
Explain: To create a stored procedure that creates the necessary tables within the database.

3. LeatherShoes_Order_TableInsert
Explain: To create a stored procedure that inserts order-related data through ETL into corresponding tables.

4. LeatherShoes_InventoryPurchaseDetail_TableInsert
Explain: To create a stored procedure that inserts inventory purchase detail related data through ETL into corresponding tables.

5. LeatherShoes_Others_TableInsert
Explain: To create a stored procedure that inserts the remaining data through ETL into corresponding tables.

6. (Optional) LeatherShoes_BasicInsert 
Explain: Since the database employs ETL for data acquisition, the execution of this file is optional. 

7. LeatherShoes_FrequentlyPurchaseTrend_Select
Explain: To create a stored procedure that queries customers who frequently purchased, excluding employees.

8. LeatherShoes_EmployeeSalesPerformance_Select
Explain: To create a stored procedure that analyzes the sales performance of employees.

9. LeatherShoes_StockIdentify_Select
Explain: To create a stored procedure that identifies current stock levels and assesses the need for additional inventory orders from suppliers.

10. LeatherShoes_TableCreate & ETL Execute Stored
Explain: To create a stored procedure that executes the previously created table and all related ETL insert stored procedures.

11. LeatherShoes_Execution
Explain: This final step executes the stored procedures established in the previous steps, along with the three business solution query stored procedures

By following these steps, one can achieve the complete functionality of the leather shoe store database, and effectively address key business challenges.

※ Just in case there is a need for dropping the created tables and the source data tables, the LeatherShoes_TableDrop and LeatherShoes_ETLTableDrop are provided.
