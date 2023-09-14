# Database Management System

Los Pollos Hermanos is a drug syndicate, and its kingpin is a very smart and fastidious person. He supervises all the operations going on in his organization daily so that he’s always informed of all the happenings in his trade.  

This database serves the purpose of storing all the information about the syndicate and provides fuctionalities for the users of the database to perform actions on the former and write various queries to get the desired outputs.  

## Requirements

### MySQL

Install and run MySQL on a [Docker container](https://swamp-season-c38.notion.site/Instructions-to-install-MySQL-in-Docker-12817f073d624673b81b277dece2ffe0).

### PyMySQL

PyMySQL is an interface for connection to the MySQL server from Python.

To install PyMySQL, you can follow either of the following two ways:

* Pip

```sh
pip install PyMySQL
```

* Conda

```sh
conda install -c anaconda pymysql
```

## Instructions to Run the Program

1. Clone the repository

    ```sh
    git clone https://github.com/SwethaVipparla/DnA-Project.git
    ```

2. Run the Docker container as per the document linked above. Load the database within the MySQL environment

    ```sh
    source ./dump.sql
    ```

3. Run the program

    ```sh
    python3 MiniWorld.py 
    ```

4. Enter the credentials of the user (same as the one used to create docker container)
5. Once connected, enter the options listed in menu to execute the queries

## Functional Requirements

Los Pollos Hermanos supports the following functional requirements:

### I. Modifications

#### 1. Insert

* Region entity  
    Inserts a new entry in the table `Region`

    ```sql
    INSERT INTO Region 
    VALUES 
    (
        '<Region_ID>',
        '<Region_Name>',
        '<Organisation_Name>',
        '<Manager_ID>'
    );
    ```

* Money Front entity  
    Inserts a new entry in the table `Money_Front`

    ```sql
    INSERT INTO Money_Front
    VALUES
    (
        '<Front_Name>',
        '<Organisation_Name>',
        '<Accountant_ID>',
        '<Amount>'
    );
    ```

* Employee entity  
    Inserts a new entry in the table `Employee`

    ```sql
    INSERT INTO Employee 
    VALUES 
    (
        '<Employee_ID>',
        '<Organisation_Name>',
        '<Employee_Type>',
        '<Start_Date>',
        '<End_Date>',
        '<Region_ID>',
        '<First_Name>',
        '<Last_Name>',
        '<Date_Of_Birth>',
        '<Salary>'
    );
    ```

#### 2. Delete

* Employee entity  
    Deletes an entry in the table `Employee` based on the `Employee_ID`

    ```sql
    DELETE FROM Employee 
    WHERE Employee_ID = '<Employee_ID>';
    ```

* Money Front entity  
    Deletes and entry in the table `Money_Front` based on (`Front_Name`,`Organisation_Name`,`Acc_Emp_ID`)

    ```sql
    DELETE FROM Money_Front 
    WHERE 
        Front_Name = '<Front_Name>' AND 
        Organisation_Name = '<Organisation_Name>' AND 
        Acc_Emp_ID = '<Account_ID>';
    ```

#### 3. Update

* Customer Entity  
    Updates the `Amount_Received` from customer in the table `Customer`

    ```sql
    UPDATE Customer 
    SET Amount_Received = '<New_Amount>' 
    WHERE Customer_ID = '<Customer_ID>'
    ```

* Producer Entity  
    Updates the `Total_Amount_Paid` to producer in the table `Producer`

    ```sql
    UPDATE Producer 
    SET Total_Amount_Paid = '<New_Amount>' 
    WHERE Producer_ID = '<Producer_ID>'
    ```

* Organisation Entity  
    Updates the `Market_Value` of the organisation in the table `Organisation`

    ```sql
    UPDATE Organisation
    SET Market_Value = '<New_Value>'
    WHERE Organisation_Name = '<Organisation_Name>'
    ```

### II. Retrievals

#### 1. Selection

* Show Drugs with purity > 90%
  
    ```sql
    SELECT * 
    FROM Drug 
    WHERE Purity > 90;
    ```

* Show Accountant Details

    ```sql
    SELECT * 
    FROM Employee 
    WHERE Employee_Type = "Accountant";
    ```

#### 2. Projection

* List all managers of who laundered amount greater than 4800
  
  ```sql
    SELECT 
        CONCAT(Employee.First_Name, " ", Employee.Last_Name) AS Name 
    FROM Employee 
    INNER JOIN Money_Front 
    ON Employee.Employee_ID = Money_Front.Acc_Emp_ID 
    WHERE Money_Front.Amount_Laundered >= 4800;
  ```

* Show Number of Employees in a Territory
  
  ```sql
    SELECT Number_of_Employees 
    FROM Territory 
    WHERE Territory_ID = "<Territory>";
  ```
  
#### 3. Aggregate

* Show Total Amount of Packages sold in a day
  
  ```sql
    SELECT 
        Sum(Falc.Packages) as Packages, 
        Falcon.Territory_ID as Territory
    FROM
    (
        SELECT SUM(Num_Pkg_bought) as Packages, Falc_Emp_ID
        FROM Buys
        WHERE Trans_Date = "<Input_Date>"
        GROUP By Falc_Emp_ID
    ) as Falc
    INNER JOIN Falcon
    WHERE Falcon.Employee_ID = Falc.Falc_Emp_ID
    GROUP BY Falcon.Territory_ID;
    ```

* Show Net profit acquired by end of the year

    ```sql
    SELECT 
        Sum(Net_Revenue) - Sum(Net_Spending) AS Net_Profit 
    FROM Organisation_Details 
    WHERE 
        Date >= "<Input_Year>-01-01" AND 
        Date <= "<Input_Year>-12-31";
    ```

#### 4. Search

* Search Phone Number of any Entity
  
    ```sql
        SELECT Phone_Number, Producer_ID as ID 
        FROM Producer_Phone_Num 
        WHERE Phone_Number LIKE "%<Input_Numbers>%" 
    UNION 
        SELECT Phone_Number, Employee_ID as ID 
        FROM Emp_Phone_Num 
        WHERE Phone_Number LIKE "%<Input_Numbers>%" 
    UNION 
        SELECT Phone_Number, Customer_ID as ID 
        FROM Cust_Phone_Num 
        WHERE Phone_Number LIKE "%<Input_Numbers>%"
  ```
  
* Search Name of Drug based on starting Letter

    ```sql
    SELECT Drug_Name 
    FROM Drug 
    WHERE Drug_Name LIKE "<Starting_Letter>%"
    ```

#### 4. Analysis

* Average number of packages sold in a region after a particular date

    ```sql
    SELECT 
        Region_ID, 
        SUM(Packages) / DATEDIFF('<Today_Date>', '<Input_Date>') as Pac
    FROM
    (
        SELECT 
            SUM(Num_Pkg_bought) as Packages, 
            Falc_Emp_ID as FID
        FROM Buys
        WHERE Trans_Date >= '<Input_Date>'
        GROUP BY FID
    ) as A
    INNER JOIN
    (
        SELECT Employee_ID, Region_ID
        FROM Employee
        WHERE Employee_Type = 'Falcon'
    ) as F
    ON F.Employee_ID = A.FID
    GROUP BY F.Region_ID;
    ```

* Profit a lieutenant generates in a week

    ```sql
    SELECT 
        Ltnt_Emp_ID, 
        Sum(amount) as Profit
    FROM
    (
        SELECT 
            FID, 
            Packages * (Total_Pkg_buy - Total_Pkg_sell) as amount
        FROM
        (
            SELECT 
                Drug_ID as DID, 
                sum(Num_Pkg_bought) as Packages, 
                Falc_Emp_ID as FID
            FROM Buys
            WHERE 
                Trans_Date >= '<Input_Date>' AND 
                Trans_Date <= DATE_ADD('<Input_Date>', INTERVAL 7 DAY)
            GROUP BY DID, Falc_Emp_ID
        ) as F
        INNER JOIN Drug
        ON Drug_ID = DID
    ) as A
    INNER JOIN Falcon
    ON Employee_ID = FID
    GROUP BY Ltnt_Emp_ID;
    ```

* Change in number of buyers in a territory over the months

    ```sql
    SELECT
        Region_ID,
        COUNT(Customer_ID) as Customers,
        EXTRACT(MONTH FROM Trans_Date) as M,
        EXTRACT(YEAR FROM Trans_Date) as Y
    FROM Buys
    INNER JOIN
    (
        SELECT Employee_ID, Region_ID
        FROM Employee
        WHERE Employee_Type = 'Falcon'
    ) as F
    ON Falc_Emp_ID = Employee_ID
    GROUP BY Y, M, Region_ID
    ORDER BY Region_ID, Y, M ASC;
    ```
