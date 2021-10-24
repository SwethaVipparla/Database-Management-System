import sys
sys.path.insert(1, '//home/swetha/Documents/IIIT Subjects/Second Year/1st Semester/Data and Applications/Project/DnA-Project')
from utils import *

def a():
    eid = input("Enter Employee ID you want to delete: ")

    query = f"DELETE FROM Employee where Employee_ID = '{eid}';"

    if executeQuery(query) == 1:
        print("Deleted From Database")
    return


def b():
    fname = input("Enter Front Name you want to delete: ")
    oname = input("Enter Organisation Name you want to delete: ")
    accid = input("Enter Accountant ID you want to delete: ")

    query = f"DELETE FROM Money_Front where Front_Name = '{fname}' AND Organisation_Name = '{oname}' AND Acc_Emp_ID = '{accid}';"

    if executeQuery(query) == 1:
        print("Deleted From Database")
    return