import MiniWorld
def a():
    cid = input("Enter Customer ID: ")
    amount = float(input("Enter Updated Amount: "))

    query = f"UPDATE Customer SET Amount_Received = {amount} where Customer_ID = '{cid}'"

    if MiniWorld.executeQuery(query) == 1:
        print("Updated Database")
    return


def b():
    pid = input("Enter Producer ID: ")
    amount = float(input("Enter Updated Amount: "))

    query = f"UPDATE Producer SET Total_Amount_Paid = {amount} where Producer_ID = '{pid}'"

    if MiniWorld.executeQuery(query) == 1:
        print("Updated Database")
    return


def c():
    name = input("Enter Organisation name: ")
    value = float(input("Enter Updated Market Value: "))

    query = f"UPDATE Organisation SET Market_Value = {value} where Organisation_Name = '{name}'"

    if MiniWorld.executeQuery(query) == 1:
        print("Updated Database")
    return