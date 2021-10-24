import subprocess as sp
import pymysql
import pymysql.cursors

def display(output):
    '''
    To display the sql outputs properly
    '''
    
    if (len(output) == 0):
        return

    maxLengths = {}
    header = output[0].keys();    
    
    for i, val in enumerate(header):
        maxLengths[i] = len(str(val))

    for row in output:
        for i, val in enumerate(row.values()):
            maxLengths[i] = max(maxLengths[i], len(str(val)))

    print('_', end='')
    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('_', end='')
    print('_', end='')

    print('\n|', end='')

    for i, val in enumerate(header):
        print(val, end='')
        for _ in range(maxLengths[i] - len(str(val)) + 2):
            print(' ', end='')
        
    print('|\n', end='')

    print('‾', end='')
    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('‾', end='')
    print('‾')

    print('_', end='')

    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('_', end='')

    print('_')

    for i, row in enumerate(output):
        print('|', end='')
        for i, val in enumerate(row.values()):
            print(val, end='')
            for _ in range(maxLengths[i] - len(str(val)) + 2):
                print(' ', end='')
        print('|\n', end='')

    print('‾', end='')
    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('‾', end='')
    print('‾')

        
def executeQuery(query):
    print(query, end='\n\n')

    try:
        cur.execute(query)
        con.commit()
        display(cur.fetchall())
    except Exception as e:
        con.rollback()
        print(">>>>>>>>>>>>>", e)


def insert_a():

    # Takes region details as input
    id = input("Enter Region ID: ")
    rname = input("Enter Region Name: ")
    oname = input("Enter Organisation Name: ")
    mgrid = input("Enter Region Manager ID: ") 

    query = f"INSERT INTO Region VALUES ('{id}','{rname}','{oname}','{mgrid}');" 

    if executeQuery(query) == 1: 
        print("Inserted Into Database")
    return


def insert_b():

    # Takes Money Front details as input
    fname = input("Enter Front Name: ")
    oname = input("Enter Organisation Name: ")
    accid = input("Enter Accountant ID: ")
    amount = float(input("Enter Amount Laundered: "))
        
    query = f"INSERT INTO Money_Front VALUES ('{fname}','{oname}','{accid}','amount');" 
    
    if executeQuery(query) == 1:
         print("Inserted Into Database")
    return


def insert_c():
    '''
    `Employee_ID` varchar(50) NOT NULL pk,
    `Organisation_Name` varchar(50) DEFAULT NULL,
    `Employee_Type` varchar(50) DEFAULT NULL,
    `Start_Date` date DEFAULT NULL,
    `End_Date` date DEFAULT NULL,
    `Region_ID` varchar(50) DEFAULT NULL,
    `First_Name` varchar(50) DEFAULT NULL,
    `Last_Name` varchar(50) DEFAULT NULL,
    `DOB` date DEFAULT NULL,
    `Salary` decimal(13,2) DEFAULT NULL,
    '''
    
    # Takes Employee details as input
    eid = input("Enter Employee ID: ")
    oname = input("Enter Organisation Name: ")
    empType = input("Enter Employee Type: ")
    sDate = input("Enter Start Date(YYYY-MM-DD): ")
    eDate = input("Enter End Date(YYYY-MM-DD): ")
    rid = input("Enter Region ID: ")
    fname = input("Enter First Name: ")
    lname = input("Enter Last Name: ")
    dob = input ("Enter Date of Birth(YYYY-MM-DD): ")
    sal = float(input("Enter Salary: "))
    
    if eDate.upper() == 'NA':
        eDate = "9999-12-31"
        
    # print(row["End_Date"])

    query = f"INSERT INTO Employee VALUES ('{eid}','{oname}','{empType}','{sDate}','{eDate}','{rid}', '{fname}','{lname}','{dob}','{sal}');"

    if executeQuery(query) == 1:
        print("Inserted Into Database")
    return


def delete_a():

    eid = input("Enter Employee ID you want to delete: ")

    query = f"DELETE FROM Employee where Employee_ID = '{eid}';"

    if executeQuery(query) == 1:
        print("Deleted From Database")
    return


def delete_b():

    fname = input("Enter Front Name you want to delete: ")
    oname = input("Enter Organisation Name you want to delete: ")
    accid = input("Enter Accountant ID you want to delete: ")

    query = f"DELETE FROM Money_Front where Front_Name = '{fname}' AND Organisation_Name = '{oname}' AND Acc_Emp_ID = '{accid}';"

    if executeQuery(query) == 1:
        print("Deleted From Database")
    return


def update_a():

    cid = input("Enter Customer ID: ")
    amount = float(input("Enter Updated Amount: "))

    query = f"UPDATE Customer SET Amount_Received = {amount} where Customer_ID = '{cid}'"

    if executeQuery(query) == 1:
        print("Updated Database")

    return

def update_b():

    pid = input("Enter Producer ID: ")
    amount = float(input("Enter Updated Amount: "))

    query = f"UPDATE Producer SET Total_Amount_Paid = {amount} where Producer_ID = '{pid}'"

    if executeQuery(query) == 1:
        print("Updated Database")

    return

def update_c():

    name = input("Enter Organisation name: ")
    value = float(input("Enter Updated Market Value: "))

    query = f"UPDATE Organisation SET Market_Value = {value} where Organisation_Name = '{name}'"

    if executeQuery(query) == 1:
        print("Updated Database")

    return


def selection_a():
    query = 'SELECT * FROM Drug WHERE Purity > 90;'
    executeQuery(query)

def selection_b():
    query = 'SELECT Number_Of_Employees FROM Territory WHERE Territory_ID = "Accountant";'
    executeQuery(query)

def projection_a():
    """
    Function to implement option 4
    """
    query = 'SELECT Employee.First_Name, Employee.Last_Name FROM Employee INNER JOIN Money_Front ON Employee.Employee_ID = Money_Front.Acc_Emp_ID WHERE Money_Front.Amount_Laundered >= 4800;'
    executeQuery(query)    

def projection_b():
    """
    Function to implement option 4
    """
    territory = input("Enter Territory ID: ")
    query = f'SELECT Number_of_Employees FROM Territory WHERE Territory_ID="{territory}";'
    executeQuery(query)   

def aggregate_a():
    '''
        we need to get the falcon ids and the number of packages bought
        from this table
    '''

    date = input("Enter Date in the form yyyy-mm-dd: ")
    query = f"""
    SELECT Sum(Falc.Packages) as Packages, Falcon.Territory_ID as Territory
    FROM 
    (
        SELECT SUM(Num_Pkg_bought) as Packages, Falc_Emp_ID
        FROM Buys
        WHERE Trans_Date = "{date}"
        GROUP By Falc_Emp_ID
    ) as Falc
    INNER JOIN Falcon
    WHERE Falcon.Employee_ID = Falc.Falc_Emp_ID
    GROUP BY Falcon.Territory_ID;
    """
    executeQuery(query)

def aggregate_b():
    year = input("Enter Year: ");
    query = f'SELECT Sum(Net_Revenue) - Sum(Net_Spending) AS Net_Profit FROM Organisation_Details WHERE Date >= "{year}-01-01" AND Date <= "{year}-12-31";'
    executeQuery(query)

def search_a():
    numbers = input("Enter numbers to search for:")
    query = f'SELECT Phone_Number FROM Producer_Phone_Num WHERE Phone_Number LIKE "%{numbers}%" UNION SELECT Phone_Number FROM Emp_Phone_Num WHERE Phone_Number LIKE "%{numbers}%" UNION SELECT Phone_Number FROM Cust_Phone_Num WHERE Phone_Number LIKE "%{numbers}%";'
    executeQuery(query)

def search_b():
    starting_letter = input("Enter starting letter: ")
    query = f'SELECT Drug_Name FROM Drug WHERE Drug_Name LIKE "{starting_letter}%"'
    executeQuery(query)

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if ch == 1:
        insert_a()
    elif ch == 2:
        insert_b()
    elif ch == 3:
        insert_c()
    elif ch == 4:
        selection_a()
    elif ch == 5:
        selection_b()
    elif ch == 6:
        projection_a()
    elif ch == 7:
        projection_b()
    elif ch == 8:
        insert_a()
    elif ch == 9:
        insert_b()
    elif ch == 11:
        insert_c()
    elif ch == 12:
        aggregate_a()
    elif ch == 13:
        aggregate_b()
    elif ch == 14:
        search_a()
    elif ch == 15:
        search_b()
    elif ch == 16:
        delete_a()
    elif ch == 17:
        delete_b()
    elif ch == 18:
        update_a()
    elif ch == 19:
        update_b()
    elif ch == 20:
        update_c()
    else:
        print("Error: Invalid Option")

# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=30306,
                              user=username,
                              password=password,
                              db='los_pollos_hermanos',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Option 1")  # Hire an Employee
                print("2. Option 2")  # Fire an Employee
                print("3. Option 3")  # Promote Employee
                print("4. Option 4")  # Employee Statistics
                print("")
                print("10. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 10:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
