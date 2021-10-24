import MiniWorld 

def a():
    query = 'SELECT * FROM Drug WHERE Purity > 90;'
    MiniWorld.executeQuery(query)

def b():
    query = 'SELECT Number_Of_Employees FROM Territory WHERE Territory_ID = "Accountant";'
    MiniWorld.executeQuery(query)
