import MiniWorld

def a():
    query = 'SELECT * FROM Drug WHERE Purity > 90;'
    MiniWorld.executeQuery(query)

def b():
    query = 'SELECT * FROM Employee WHERE Employee_Type = "Accountant";'
    MiniWorld.executeQuery(query)
