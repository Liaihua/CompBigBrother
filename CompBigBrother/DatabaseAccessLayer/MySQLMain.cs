﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Windows;
using Microsoft.Win32;
using System.Diagnostics;

namespace CompBigBrother
{
    internal class MySQLMain
    {
        protected static MySqlConnection connection;

        internal static void SetupMySqlConnection()
        {
            DatabaseConnectionOptions LocalConectionOptions = DatabaseConnectionOptions.GetValues();
            MySqlConnectionStringBuilder stringBuilder = new MySqlConnectionStringBuilder
            {
                UserID = LocalConectionOptions.User,
                Server = LocalConectionOptions.Server,
                Database = LocalConectionOptions.DB,
                Password = LocalConectionOptions.Password,
                CharacterSet = "UTF8"
            };
            connection = new MySqlConnection(stringBuilder.ToString());
        }

        public static bool OpenConnection()
        {
            try
            {
                if (connection == null)
                    SetupMySqlConnection();
                connection.Open();
                return true;
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                return false;
            }
        }

        public static void CloseConnection()
        {
            try
            {
                connection.Close();
            }
            catch(Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }

        internal static bool TestConnection()
        {
            try
            {
                connection.Open();
                connection.Close();
                return true;
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                return false;
            }
        }

        protected static void ExecuteNonQuery(string query)
        {
            if(OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                    command.ExecuteNonQuery();
                CloseConnection();
            }
        }
        
        public static int ShowNextId(string table)
        {
            int result = -1;
            string query = $"show table status where Name = '{table}'";
            if (OpenConnection())
            using (MySqlCommand command = new MySqlCommand(query, connection))
            {
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                        result = reader.GetInt32("Auto_increment");
                }
                CloseConnection();
            }
            return result;
        }

        public static void MakeBackup()
        {
            SaveFileDialog saveDumpFileDialog = new SaveFileDialog();
            saveDumpFileDialog.Title = "Экспорт БД";
            saveDumpFileDialog.DefaultExt = ".sql";
            saveDumpFileDialog.ShowDialog();
            if (OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand("", connection))
                {
                    using (MySqlBackup backup = new MySqlBackup(command))
                    {
                        if (!string.IsNullOrWhiteSpace(saveDumpFileDialog.FileName))
                            backup.ExportToFile(saveDumpFileDialog.FileName);
                    }
                }
                CloseConnection();
            }
        }

        public static void LoadBackup()
        {
            OpenFileDialog openDumpFileDialog = new OpenFileDialog();
            openDumpFileDialog.Title = "Импорт БД";
            openDumpFileDialog.DefaultExt = ".sql";
            openDumpFileDialog.ShowDialog();
            if (OpenConnection())
            {
                using(MySqlCommand command = new MySqlCommand("", connection))
                {
                    using(MySqlBackup backup = new MySqlBackup(command))
                    {
                        if(!string.IsNullOrWhiteSpace(openDumpFileDialog.FileName))
                            backup.ImportFromFile(openDumpFileDialog.FileName);
                    }
                }
                CloseConnection();
            }
        }
    }
}
