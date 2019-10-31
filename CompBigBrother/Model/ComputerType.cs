using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
namespace CompBigBrother.Model
{
    class ComputerType : MySQLMain
    {
        public static readonly Dictionary<int, string> ComputerTypes = new Dictionary<int, string>();

        public static void GetAllComputerTypes()
        {
            string query = "SELECT * FROM meta_computer_type";
            try
            {
                if (OpenConnection())
                {
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        using (MySqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ComputerTypes.Add(reader.GetInt32("id"), reader.GetString("type_name"));
                            }
                        }
                    }
                    CloseConnection();
                }
            } 
            catch (Exception ex) { System.Windows.MessageBox.Show(ex.Message); }
        }
    }
}
