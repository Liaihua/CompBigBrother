using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
namespace CompBigBrother.Model
{
    class UserType : MySQLMain
    {
        public static Dictionary<int, string> GetAllUserTypes()
        {
            Dictionary<int, string> UserTypes = new Dictionary<int, string>();
            string query = "SELECT * FROM user_type";
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
                return UserTypes;
            }
            catch (Exception ex) { System.Windows.MessageBox.Show(ex.Message); return null; }
        }
    }
}
