import MiniWorld

def a():
    date = input("Enter Date in the form yyyy-mm-dd: ")
    query = f"""
    SELECT Sum(Falc.Packages) as Packages, Falcon.Territory_ID as Territory
    FROM
    (
        SELECT SUM(Num_Pkg_bought) as Packages, Falc_Emp_ID
        FROM Buys
        WHERE Trans_Date = "{date}"
        GROUP By Falc_Emp_ID
    ) as Falc
    INNER JOIN Falcon
    WHERE Falcon.Employee_ID = Falc.Falc_Emp_ID
    GROUP BY Falcon.Territory_ID;
    """
    MiniWorld.executeQuery(query)

def b():
    year = input("Enter Year: ");
    query = f'SELECT Sum(Net_Revenue) - Sum(Net_Spending) AS Net_Profit FROM Organisation_Details WHERE Date >= "{year}-01-01" AND Date <= "{year}-12-31";'
    MiniWorld.executeQuery(query)
