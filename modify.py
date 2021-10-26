import subprocess as sp
from insert import insert
from delete import delete
from update import update

def modify():
    while(1):
        tmp = sp.call('clear', shell=True)
        print("1. Insert")
        print("2. Delete")
        print("3. Update")
        print("")
        print("4. Back")
        print("5. Exit")

        ch = input("Enter choice> ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1' or ch == 'insert':
            insert()
        elif ch == '2' or ch == 'delete':
            delete()
        elif ch == '3' or ch == 'update':
            update()
        elif ch == '4' or ch == 'back':
            return
        elif ch == '5' or ch == 'exit':
            exit()
        else:
            print("Invalid Option")

        input("Enter any key to CONTINUE>")
