import MiniWorld
def a():
    eid = input("Enter Employee ID you want to delete: ")

    query = f"DELETE FROM Employee where Employee_ID = '{eid}';"

    if MiniWorld.executeQuery(query) == 1:
        print("Deleted From Database")
    return


def b():
    fname = input("Enter Front Name you want to delete: ")
    oname = input("Enter Organisation Name you want to delete: ")
    accid = input("Enter Accountant ID you want to delete: ")

    query = f"DELETE FROM Money_Front where Front_Name = '{fname}' AND Organisation_Name = '{oname}' AND Acc_Emp_ID = '{accid}';"

    if MiniWorld.executeQuery(query) == 1:
        print("Deleted From Database")
    return