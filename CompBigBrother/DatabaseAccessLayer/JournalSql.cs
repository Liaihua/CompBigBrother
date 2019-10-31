using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CompBigBrother.Model;
using MySql.Data.MySqlClient;
namespace CompBigBrother.DatabaseAccessLayer
{
    class JournalSql : MySQLMain
    {
        public List<JournalEvent> GetJournal()
        {
            List<JournalEvent> journalEvents = new List<JournalEvent>();
            string query = "SELECT * FROM journal";
            if (OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            journalEvents.Add(
                                new JournalEvent
                                {
                                    ID = reader.GetInt32("id"),
                                    DateTime = reader.GetDateTime("date_time"),
                                    LogObjectID = reader.GetInt32("log_type"),
                                    Info = reader.GetString("info")
                                });
                        }
                    }
                }
                CloseConnection();
            }

            return journalEvents;
        }
    }
}
