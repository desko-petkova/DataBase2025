using Microsoft.Data.SqlClient;

namespace LoginDb
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Username: ");
            string username = Console.ReadLine();

            Console.Write("Password: ");
            string password = Console.ReadLine();//' OR '1'='1

            string connectionString = @"Server=(localdb)\MSSQLLocalDB;Database=LoginDemo;Trusted_Connection=True;";

            using SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string sql = "SELECT * FROM Users WHERE Username = '" + username +
                         "' AND Password = '" + password + "'";


            SqlCommand cmd = new SqlCommand(sql, con);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                Console.WriteLine("Login successful");
            }
            else
            {
                Console.WriteLine("Login failed");
            }
        }
    }
}
