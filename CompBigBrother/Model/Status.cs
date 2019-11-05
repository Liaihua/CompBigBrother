using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
namespace CompBigBrother
{
    class Status : MySQLMain
    {
        public static readonly Dictionary<int, string> Statuses = new Dictionary<int, string>();

        public static void GetAllStatuses()
        {
            string query = "SELECT * FROM meta_status";
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
                                Statuses.Add(reader.GetInt32("id"), reader.GetString("status_name"));
                            }
                        }
                    }
                    CloseConnection();
                }
            }
            catch (Exception ex) { CloseConnection(); } 
        }
    }
}
