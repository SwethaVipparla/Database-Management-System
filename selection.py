import MiniWorld
import subprocess as sp

def a():
    query = 'SELECT * FROM Drug WHERE Purity > 90;'
    MiniWorld.executeQuery(query)


def b():
    query = 'SELECT * FROM Employee WHERE Employee_Type = "Accountant";'
    MiniWorld.executeQuery(query)


def selection():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("1. Drugs with purity > 90")
        print("2. Accountant Details")
        print("")
        print("3. Back")
        print("4. Exit")

        ch = input("Enter choice> ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1' or ch == 'drugs with purity > 90':
            a()
        elif ch == '2' or ch == 'accountant details':
            b()
        elif ch == '3' or ch == 'back':
            return
        elif ch == '4' or ch == 'exit':
            exit()
        else:
            print("Invalid Option")

        input("Enter any key to CONTINUE>")
