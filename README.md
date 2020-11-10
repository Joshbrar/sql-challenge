# sql-challenge
SQL Challenge


The Analysis for the employees for the years 1986 through 1993 have been done.
 There are two sql query documents. 


  - The first (Generate_Tables.sql ) file  has to be executed first. The sqls statement when ran will the create database tables , constraints like Primary Keys and Foreign Keys etc.


  - The importing of the data has to be performed in the following sequence.

          Import departments.csv file  (Corresponding Table  - department_tbl )

          Import titles.csv file       (Corresponding Table  - job_titles_tbl )

          Import employees.csv         (Corresponding Table  - employees_tbl  )

          Import salaries.csv          (Corresponding Table  - emp_salary_tbl ) (has a first column (salary_id) as primary key, remove this from the column tab during the import process , see Image salary_import.png )  

          Import dept_manager.csv      (Corresponding Table  - dept_manager_tbl) (has a first column (mgr_id) as primary key, remove this from the column tab during the import process , see Image manager_import.png )  

          Import dept_emp.csv          (Corresponding Table  - dept_employees_tbl) has a first column (ID) as primary key, remove this from the column tab during the import process , see Image emp_dept_import.png )  


  - The second (DataAnalysis_Query.sql )sql document contains the queries that were requested from the higher management. 

  - The ER Diagrams have also been posted. 
    The images for the ER diagrams  are SQL_Challenge_ER_Diagram_Detailed.png and SQL_Challenge_ER_Diagram.png

# Bonus

The jupyter file name is PewlettHackard_Analysis.ipynb

  1.Import the SQL database into Pandas. - Done . The database connection is performed and the data is loaded into the data frames.
  In the file the password is left out intentionally - create_engine('postgresql://postgres:*****@localhost:5432/GlobalFirePower')
  
  2.The histogram is plotted for the salary ranges. See Image - histogram_salary_range.

  3. The bar chart for the average salary is there. See Image - avg_salary_titles.png
  