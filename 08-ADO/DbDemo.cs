using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO_ex
{
   List<string> employeesList = new List<string>();
string connectionString = "Server=(localdb)\\MSSQLLocalDB;Database=SoftUni;Trusted_Connection=True;";

using var connection = new SqlConnection(connectionString);

connection.Open();

//string query = "SELECT TOP (@top) * FROM Employees WHERE DepartmentID = @DepId";
//string sql = "SELECT TOP (@top) * FROM Employees WHERE DepartmentID = @DepId ORDER BY Salary DESC;";
string s = @"SELECT e.FirstName, e.LastName, ad.AddressText, t.[Name]
FROM Employees e
JOIN Addresses ad ON ad.AddressID = e.AddressID
JOIN Towns t ON t.TownID = ad.TownID
WHERE t.Name = @townName";
using var cmd = new SqlCommand(s, connection);
cmd.Parameters.AddWithValue("@DepId", 1);
cmd.Parameters.Add("@top", System.Data.SqlDbType.Int).Value = 10;
cmd.Parameters.Add("@townName", System.Data.SqlDbType.NVarChar, 20).Value = "Sofia";

var dbReader = cmd.ExecuteReader();
using (dbReader)
{
    while (dbReader.Read())
    {
        //string firstName = dbReader.GetString(1);
        //string lastName = dbReader["LastName"].ToString()!;
        //employeesList.Add($"{firstName} {lastName}");
        Console.WriteLine($"{dbReader["FirstName"]} " +
            $"{dbReader["LastName"]} -> {dbReader["Name"]}");
    }
}
// Console.WriteLine(string.Join("\n", employeesList));

//INSERT
string query = "INSERT INTO Towns(Name) VALUES (@townName)";
using var insertCommand = new SqlCommand(query, connection);
insertCommand.Parameters.Add("@townName",
    System.Data.SqlDbType.NVarChar, 20).Value = "Razgrad";

var affectedRows = insertCommand.ExecuteNonQuery();
Console.WriteLine($"{affectedRows} row affected");

//DELETE
string deleteQuery = "DELETE FROM Towns WHERE Name = @townName";
using var deleteCommand = new SqlCommand(deleteQuery, connection);
deleteCommand.Parameters.Add("@townName",
    System.Data.SqlDbType.NVarChar).Value = "Razgrad";

var deletedRows = deleteCommand.ExecuteNonQuery();
Console.WriteLine($"{deletedRows} rows are deleted");

//UPDATE
string updateQuery = @"UPDATE Employees
                   SET Salary = Salary * @raiseSalary
                   WHERE DepartmentID = @depId AND Salary < @maxSalary";
using var updateCommand = new SqlCommand(updateQuery, connection);
updateCommand.Parameters.Add("@raiseSalary",
    System.Data.SqlDbType.Decimal).Value = 1.10;
updateCommand.Parameters.Add("@depId",
    System.Data.SqlDbType.Int).Value = 7;
updateCommand.Parameters.Add("@maxSalary",
    System.Data.SqlDbType.Decimal).Value = 20000;

var updatedRows = updateCommand.ExecuteNonQuery();
Console.WriteLine($"{updatedRows} employees updated");

//COUNT
string countQuery = @"SELECT COUNT(*)
                 FROM Employees
                WHERE DepartmentID = @depId";
using var countCommand = new SqlCommand(countQuery, connection);
countCommand.Parameters.AddWithValue("@depId", 7);

var employeesCount = countCommand.ExecuteScalar();
Console.WriteLine($"Employees in dep 7: {employeesCount}");
}
