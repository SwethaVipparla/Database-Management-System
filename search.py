import MiniWorld
def a():
    numbers = input("Enter numbers to search for:")
    query = f'SELECT Phone_Number FROM Producer_Phone_Num WHERE Phone_Number LIKE "%{numbers}%" UNION SELECT Phone_Number FROM Emp_Phone_Num WHERE Phone_Number LIKE "%{numbers}%" UNION SELECT Phone_Number FROM Cust_Phone_Num WHERE Phone_Number LIKE "%{numbers}%";'
    MiniWorld.executeQuery(query)


def b():
    starting_letter = input("Enter starting letter: ")
    query = f'SELECT Drug_Name FROM Drug WHERE Drug_Name LIKE "{starting_letter}%"'
    MiniWorld.executeQuery(query)