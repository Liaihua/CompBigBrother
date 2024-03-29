﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CompBigBrother.Model;
using MySql.Data.MySqlClient;
namespace CompBigBrother.DatabaseAccessLayer
{
    class ComponentSql: MySQLMain
    {
        public static Dictionary<int, string> ComputersKeyValue = new Dictionary<int, string>();
        public List<CompComponent> GetAllComponents()
        {
            GetAllComputerKeyValues();
            List<CompComponent> components = new List<CompComponent>();
            string query = "SELECT * FROM components";
            if (OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            if (reader.GetInt32("id") == -1)
                                continue;
                            components.Add(
                                new CompComponent
                                {
                                    ID = reader.GetInt32("id"),
                                    Name = reader.GetString("component_name"),
                                    Price = reader.GetFloat("component_price"),
                                    SerialNumber = reader.GetString("serial_number"),
                                    ComputerID = reader.GetInt32("computer_id"),
                                    StatusID = reader.GetInt32("status"),
                                    ComputerValue = ComputersKeyValue[reader.GetInt32("computer_id")]
                                    
                                });
                        }
                    }
                }
                CloseConnection();
            }

            return components;
        }

        public void InsertComponent(CompComponent component)
        {
            component.ID = ShowNextId("components");
            string query = "INSERT INTO components VALUE (0, @a, @b, -1, @d, @e)";
            if (OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    MySqlParameter parameter = new MySqlParameter("@a", MySqlDbType.String);
                    parameter.Value = component.Name;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@b", MySqlDbType.Float);
                    parameter.Value = component.Price;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@d", MySqlDbType.Int32);
                    parameter.Value = component.StatusID;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@e", MySqlDbType.String);
                    parameter.Value = component.SerialNumber;
                    command.Parameters.Add(parameter);
                    command.ExecuteNonQuery();
                }
                CloseConnection();
            }
        }

        public void UpdateComponent(CompComponent component)
        {
            string query = $"UPDATE components SET component_name = @a, component_price = @b, computer_id = @c, serial_number = @d, status = @e WHERE id = {component.ID}";
            if (OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    MySqlParameter parameter = new MySqlParameter("@a", MySqlDbType.String);
                    parameter.Value = component.Name;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@b", MySqlDbType.Float);
                    parameter.Value = component.Price;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@c", MySqlDbType.Int32);
                    parameter.Value = component.ComputerID;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@d", MySqlDbType.String);
                    parameter.Value = component.SerialNumber;
                    command.Parameters.Add(parameter);
                    parameter = new MySqlParameter("@e", MySqlDbType.Int32);
                    parameter.Value = component.StatusID;
                    command.Parameters.Add(parameter);
                    command.ExecuteNonQuery();
                }
                CloseConnection();
            }
        }

        public void DeleteComponent(CompComponent component)
        {
            if (component == null)
                return;
            string query = $"DELETE FROM components WHERE id = {component.ID}";
            ExecuteNonQuery(query);
        }

        private void GetAllComputerKeyValues()
        {
            string query = "SELECT computers.id, computers.computer_name FROM computers";
            Dictionary<int, string> keyValuesTemp = new Dictionary<int, string>();
            if (OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                            keyValuesTemp.Add(reader.GetInt32("id"), reader.GetString("computer_name"));
                    }
                }
                CloseConnection();
            }
            ComputersKeyValue = keyValuesTemp;
        }
    }
}
