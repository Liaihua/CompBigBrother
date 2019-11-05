using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CompBigBrother.Model;
using MySql.Data.MySqlClient;

namespace CompBigBrother.DatabaseAccessLayer
{
    class RoomSql : MySQLMain
    {
        public static Dictionary<int, string> RoomsKeyValues = new Dictionary<int, string>();
        public List<Room> GetAllRooms()
        {
            List<Room> rooms = new List<Room>();
            string query = "SELECT * FROM rooms";
            if (OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                using (MySqlDataReader reader = command.ExecuteReader())
                    while (reader.Read())
                    {
                        rooms.Add(new Room
                        {
                            ID = reader.GetInt32("id"),
                            Num = reader.GetString("room_name")
                        });
                    }
                CloseConnection();
            }
            RoomsKeyValues = ConvertRoomsToDictionary(rooms);
            return rooms;
        }

        private Dictionary<int, string> ConvertRoomsToDictionary(List<Room> rooms)
        {
            Dictionary<int, string> ConvertedDictionary = new Dictionary<int, string>();
            foreach (Room room in rooms)
                ConvertedDictionary.Add(room.ID, room.Num);
            return ConvertedDictionary;
        }

        public void InsertRoom(Room room)
        {
            string query = "INSERT INTO rooms VALUE (0, @a)";
            if (OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    MySqlParameter parameter = new MySqlParameter("@a", MySqlDbType.String);
                    parameter.Value = room.Num;
                    command.Parameters.Add(parameter);
                    command.ExecuteNonQuery();
                }
                CloseConnection();
            }
        }

        public void UpdateRoom(Room room)
        {
            string query = $"UPDATE rooms SET room_name = @a WHERE id = {room.ID}";
            if (OpenConnection())
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    MySqlParameter parameter = new MySqlParameter("@a", MySqlDbType.String);
                    parameter.Value = room.Num;
                    command.Parameters.Add(parameter);
                    command.ExecuteNonQuery();
                }
                CloseConnection();
            }
        }

        public void DeleteRoom(Room room)
        {
            if (room == null)
                return;
            string query = $"DELETE FROM rooms WHERE id = {room.ID}";
            ExecuteNonQuery(query);
        }
    }
}
