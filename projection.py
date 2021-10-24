import MiniWorld

def a():
    query = 'SELECT Employee.First_Name, Employee.Last_Name FROM Employee INNER JOIN Money_Front ON Employee.Employee_ID = Money_Front.Acc_Emp_ID WHERE Money_Front.Amount_Laundered >= 4800;'
    MiniWorld.executeQuery(query)    


def b():
    territory = input("Enter Territory ID: ")
    query = f'SELECT Number_of_Employees FROM Territory WHERE Territory_ID="{territory}";'
    MiniWorld.executeQuery(query)   
