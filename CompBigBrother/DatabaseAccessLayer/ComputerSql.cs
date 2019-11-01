using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CompBigBrother.Model;
using MySql.Data.MySqlClient;
namespace CompBigBrother.DatabaseAccessLayer
{
    class ComputerSql : MySQLMain
    {
        public List<Computer> GetAllComputers()
        {
            List<Computer> computers = new List<Computer>();
            string query = "SELECT * FROM computers";
            if(OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while(reader.Read())
                        {
                            if (reader.GetInt32("id") == -1)
                                continue;
                            computers.Add(
                                new Computer
                                {
                                    ID = reader.GetInt32("id"),
                                    Name = reader.GetString("computer_name"),
                                    Price = reader.GetFloat("price"),
                                    SerialNumber = reader.GetString("serial_number"),
                                    RoomID = reader.GetInt32("room_id"),
                                    StatusID = reader.GetInt32("status"),
                                    TypeID = reader.GetInt32("type")
                                });                           
                        }
                    }
                }
                CloseConnection();
            }
            
            return computers;
        }

        public void InsertComputer(Computer computer)
        {
            computer.ID = ShowNextId("computers");
            string query = "INSERT INTO computers VALUE (0, @a, @b, @c, @d, @e, @f)";
            if(OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    MySqlParameter parameter = new MySqlParameter("@a", MySqlDbType.String);
                    parameter.Value = computer.Name;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@b", MySqlDbType.Float);
                    parameter.Value = computer.Price;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@c", MySqlDbType.String);
                    parameter.Value = computer.SerialNumber;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@d", MySqlDbType.Int32);
                    parameter.Value = computer.StatusID;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@e", MySqlDbType.Int32);
                    parameter.Value = computer.RoomID;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@f", MySqlDbType.Int32);
                    parameter.Value = computer.TypeID;
                    command.Parameters.Add(parameter);
                    command.ExecuteNonQuery();
                }
                CloseConnection();
            }
        }

        public void UpdateComputer(Computer computer)
        {
            string query = $"UPDATE computers SET computer_name = @a, price = @b, serial_number = @c, status = @d, room_id = @e, type = @f WHERE id = {computer.ID}";
            if (OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    MySqlParameter parameter = new MySqlParameter("@a", MySqlDbType.String);
                    parameter.Value = computer.Name;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@b", MySqlDbType.Float);
                    parameter.Value = computer.Price;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@c", MySqlDbType.String);
                    parameter.Value = computer.SerialNumber;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@d", MySqlDbType.Int32);
                    parameter.Value = computer.StatusID;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@e", MySqlDbType.Int32);
                    parameter.Value = computer.RoomID;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@f", MySqlDbType.Int32);
                    parameter.Value = computer.TypeID;
                    command.Parameters.Add(parameter);
                    command.ExecuteNonQuery();
                }
                CloseConnection();
            }
        }

        public void Deletecomputer(Computer computer)
        {
            if (computer == null)
                return;
            string query = $"DELETE FROM computers WHERE id = {computer.ID}";
            ExecuteNonQuery(query);
        }
    }
}
