import subprocess as sp
import pymysql
import pymysql.cursors
import utils
import colours

import modify
import retrieve

def display(output):

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
            print('_', end = '')

    print('_')
    print('|', end='')

    for i, val in enumerate(header):
        print(val, end='')
        for _ in range(maxLengths[i] - len(str(val)) + 2):
            print(' ', end = '')

    print('|')
    print('‾', end='')

    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('‾', end = '')

    print('‾')
    print('_', end='')

    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('_', end = '')

    print('_')

    for i, row in enumerate(output):
        print('|', end = '')
        for i, val in enumerate(row.values()):
            print(val, end = '')
            for _ in range(maxLengths[i] - len(str(val)) + 2):
                print(' ', end = '')
        print('|')

    print('‾', end='')
    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('‾', end = '')
    print('‾')


def executeQuery(query):
    print(query, end='\n\n')

    try:
        cur.execute(query)
        con.commit()
        display(cur.fetchall())
        return 1

    except Exception as e:
        con.rollback()
        print(f"{colours.bcolors.FAIL}>>{colours.bcolors.ENDC}", e)
        return -1

def execute():
    query = input("Input any query to execute: ")
    executeQuery(query)
    input("Enter any key to continue: ")

def dispatch(ch):
    if ch == '1' or ch == 'modify':
        modify.modify()
    elif ch == '2' or ch == 'retrieve':
        retrieve.retrieve()
    elif ch == '3' or ch == 'execute':
        execute()
    elif ch == '4' or ch == 'exit':
        exit()
    else:
        print("Invalid Option")

# Global
while(1):
    tmp = sp.call('clear', shell=True)

    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        con = pymysql.connect(host = 'localhost',
                              port = 30306,
                              user = username,
                              password = password,
                              db = 'los_pollos_hermanos',
                              cursorclass = pymysql.cursors.DictCursor)

        tmp = sp.call('clear', shell = True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        # tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell = True)
                print("What would you like to do today?")
                print(f"{colours.bcolors.OKCYAN}")
                print("1. Modify")
                print("2. Retrieve")
                print("3. Execute")
                print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
                print("4. Exit")
                print(f"{colours.bcolors.ENDC}")
                ch = input("Enter choice: ").lower()
                tmp = sp.call('clear', shell = True)
                dispatch(ch)

    except Exception as e:
        tmp = sp.call('clear', shell = True)
        print(e)
