import MiniWorld
import subprocess as sp

def a():
    numbers = input("Enter numbers to search for:")
    query = f'SELECT Phone_Number FROM Producer_Phone_Num WHERE Phone_Number LIKE "%{numbers}%" UNION SELECT Phone_Number FROM Emp_Phone_Num WHERE Phone_Number LIKE "%{numbers}%" UNION SELECT Phone_Number FROM Cust_Phone_Num WHERE Phone_Number LIKE "%{numbers}%";'
    MiniWorld.executeQuery(query)


def b():
    starting_letter = input("Enter starting letter: ")
    query = f'SELECT Drug_Name FROM Drug WHERE Drug_Name LIKE "{starting_letter}%"'
    MiniWorld.executeQuery(query)

def search():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("1. Phone Number")
        print("2. Drug")
        print("")
        print("3. Back")
        print("4. Exit")

        ch = input("Enter choice> ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1' or ch == 'phone number':
            a()
        elif ch == '2' or ch == 'drug':
            b()
        elif ch == '3' or ch == 'back':
            return
        elif ch == '4' or ch == 'exit':
            exit()
        else:
            print("Invalid Option")

        input("Enter any key to CONTINUE>")
