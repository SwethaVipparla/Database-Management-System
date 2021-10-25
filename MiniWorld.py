import subprocess as sp
import pymysql
import pymysql.cursors
import aggregate, delete, insert, projection, search, selection, update, analysis

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
            print('_', end='')

    print('_')
    print('|', end='')

    for i, val in enumerate(header):
        print(val, end='')
        for _ in range(maxLengths[i] - len(str(val)) + 2):
            print(' ', end='')

    print('|')
    print('‾', end='')

    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('‾', end='')

    print('‾')
    print('_', end='')

    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('_', end='')

    print('_')

    for i, row in enumerate(output):
        print('|', end='')
        for i, val in enumerate(row.values()):
            print(val, end='')
            for _ in range(maxLengths[i] - len(str(val)) + 2):
                print(' ', end='')
        print('|')

    print('‾', end='')
    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('‾', end='')
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
        print(">>>>>>>>>>>>>", e)
        return -1

def dispatch(ch):
    if ch == 1:
        insert.a()
    elif ch == 2:
        insert.b()
    elif ch == 3:
        insert.c()
    elif ch == 4:
        selection.a()
    elif ch == 5:
        selection.b()
    elif ch == 6:
        projection.a()
    elif ch == 7:
        projection.b()
    elif ch == 8:
        insert.a()
    elif ch == 9:
        insert.b()
    elif ch == 11:
        insert.c()
    elif ch == 12:
        aggregate.a()
    elif ch == 13:
        aggregate.b()
    elif ch == 14:
        search.a()
    elif ch == 15:
        search.b()
    elif ch == 16:
        delete.a()
    elif ch == 17:
        delete.b()
    elif ch == 18:
        update.a()
    elif ch == 19:
        update.b()
    elif ch == 20:
        update.c()
    elif ch == 21:
        analysis.a()
    elif ch == 22:
        analysis.b()
    elif ch == 23:
        analysis.c()
    else:
        print("Error: Invalid Option")

# Global
while(1):
    tmp = sp.call('clear', shell=True)

    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        con = pymysql.connect(host='localhost',
                              port=30306,
                              user=username,
                              password=password,
                              db='los_pollos_hermanos',
                              cursorclass=pymysql.cursors.DictCursor)

        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        # tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Option 1")  # Hire an Employee
                print("2. Option 2")  # Fire an Employee
                print("3. Option 3")  # Promote Employee
                print("4. Option 4")  # Employee Statistics
                print("")
                print("10. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 10:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
