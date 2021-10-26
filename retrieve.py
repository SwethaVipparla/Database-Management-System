import subprocess as sp
import colours
from selection import selection
from projection import projection
from aggregate import aggregate
from search import search
from analysis import analysis

def retrieve():
    while(1):
        tmp = sp.call('clear', shell = True)
        print("Choose an operation:")
        print(f"{colours.bcolors.OKCYAN}")
        print("1. Selection")
        print("2. Projection")
        print("3. Aggregate")
        print("4. Search")
        print("5. Analysis")
        print(f"{colours.bcolors.ENDC}{colours.bcolors.WARNING}")
        print("6. Back")
        print("7. Exit")
        print(f"{colours.bcolors.ENDC}")

        ch = input("Enter choice: ").lower()
        tmp = sp.call('clear', shell=True)

        if ch == '1' or ch == 'selection':
            selection()
        elif ch == '2' or ch == 'projection':
            projection()
        elif ch == '3' or ch == 'aggregate':
            aggregate()
        elif ch == '4' or ch == 'search':
            search()
        elif ch == '5' or ch == 'analysis':
            analysis()
        elif ch == '6' or ch == 'back':
            return
        elif ch == '7' or ch == 'exit':
            exit()
        else:
            print(f"{colours.bcolors.RED}Invalid Option{colours.bcolors.ENDC}")

        input("Enter any key to continue: ")