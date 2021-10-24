import MiniWorld

def a():

    # Takes region details as input
    id = input("Enter Region ID: ")
    rname = input("Enter Region Name: ")
    oname = input("Enter Organisation Name: ")
    mgrid = input("Enter Region Manager ID: ") 

    query = f"INSERT INTO Region VALUES ('{id}','{rname}','{oname}','{mgrid}');" 

    if MiniWorld.executeQuery(query) == 1: 
        print("Inserted Into Database")

    return

def b():

    # Takes Money Front details as input
    fname = input("Enter Front Name: ")
    oname = input("Enter Organisation Name: ")
    accid = input("Enter Accountant ID: ")
    amount = float(input("Enter Amount Laundered: "))
        
    query = f"INSERT INTO Money_Front VALUES ('{fname}','{oname}','{accid}','amount');" 
    
    if MiniWorld.executeQuery(query) == 1:
         print("Inserted Into Database")

    return

def c():
    
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

    if MiniWorld.executeQuery(query) == 1:
        print("Inserted Into Database")

    return
