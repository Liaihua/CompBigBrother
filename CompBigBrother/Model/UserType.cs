using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
namespace CompBigBrother
{
    class UserType : MySQLMain
    {
        public static readonly Dictionary<int, string> UserTypes = new Dictionary<int, string>();

        public static void GetAllUserTypes()
        {
            string query = "SELECT * FROM meta_user_type";
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
                                UserTypes.Add(reader.GetInt32("id"), reader.GetString("type"));
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
