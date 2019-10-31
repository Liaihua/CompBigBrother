using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CompBigBrother.Model;
using MySql.Data.MySqlClient;
namespace CompBigBrother.DatabaseAccessLayer
{
    class UserSql : MySQLMain
    {
        public static List<User> GetAllUsers()
        {
            List<User> Users = new List<User>();
            string query = "SELECT * FROM users";
            if (OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Users.Add(new User
                            {
                                ID = reader.GetInt32("id"),
                                FirstName = reader.GetString("first_name"),
                                LastName = reader.GetString("last_name"),
                                CabID = reader.GetInt32("cab_id"),
                                UserType = reader.GetInt32("type")
                            });
                        }
                    }
                }
                CloseConnection();
            }
            return Users;
        }

        public static void InsertUser(User user)
        {
            user.ID = ShowNextId("users");
            string query = "INSERT INTO users VALUE (0, @a, @b, @c, @d)";
            if(OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    MySqlParameter parameter = new MySqlParameter("@a", MySqlDbType.String);
                    parameter.Value = user.FirstName;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@b", MySqlDbType.String);
                    parameter.Value = user.LastName;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@c", MySqlDbType.Int32);
                    parameter.Value = user.CabID;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@d", MySqlDbType.String);
                    parameter.Value = user.UserType;
                    command.Parameters.Add(parameter);
                    command.ExecuteNonQuery();
                }
                CloseConnection();
            }
        }

        public static void UpdateUser(User user)
        {
            string query = $"UPDATE users SET first_name = @a, last_name = @b, cab_id = @c, type = @d, WHERE id = {user.ID}";
            if (OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    MySqlParameter parameter = new MySqlParameter("@a", MySqlDbType.String);
                    parameter.Value = user.FirstName;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@b", MySqlDbType.String);
                    parameter.Value = user.LastName;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@c", MySqlDbType.Int32);
                    parameter.Value = user.CabID;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@d", MySqlDbType.String);
                    parameter.Value = user.UserType;
                    command.Parameters.Add(parameter);
                    command.ExecuteNonQuery();
                }
                CloseConnection();
            }
        }

        public static void DeleteUser(User user)
        {
            if (user == null)
                return;
            string query = $"DELETE FROM users WHERE id = {user.ID}";
            ExecuteNonQuery(query);
        }
    }
}
