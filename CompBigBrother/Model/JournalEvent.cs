using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
namespace CompBigBrother.Model
{
    public class JournalEvent : AbstractNotifyModel
    {
        private int id;
        private int logObjectId;
        private DateTime dateTime;
        private string info;

        public int ID { get => id; set { id = value; RaiseEvent(nameof(ID)); } }
        public int LogObjectID { get => logObjectId; set { logObjectId = value; RaiseEvent(nameof(LogObjectID)); } }
        public DateTime DateTime { get => dateTime; set { dateTime = value; RaiseEvent(nameof(DateTime)); } }
        public string Info { get => info; set { info = value; RaiseEvent(nameof(Info)); } }
        public string LogObjectValue { get => LogObject.LogObjects[logObjectId]; }
    }

    class LogObject : MySQLMain
    {
        public static readonly Dictionary<int, string> LogObjects = new Dictionary<int, string>();
        public static void GetAllLogObjects()
        {
            string query = "SELECT * FROM meta_log_object";
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
                                LogObjects.Add(reader.GetInt32("id"), reader.GetString("type"));
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
