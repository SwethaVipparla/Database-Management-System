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


def update():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("1. Customer Amount")
        print("2. Producer Amount")
        print("3. Organisation market value")
        print("")
        print("4. Back")
        print("5. Exit")

        ch = input("Enter choice> ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1' or ch == 'customer amount':
            a()
        elif ch == '2' or ch == 'producer amount':
            b()
        elif ch == '3' or ch == 'organisation market value':
            c()
        elif ch == '4' or ch == 'back':
            return
        elif ch == '5' or ch == 'exit':
            exit()
        else:
            print("Invalid Option")

        input("Enter any key to CONTINUE>")

