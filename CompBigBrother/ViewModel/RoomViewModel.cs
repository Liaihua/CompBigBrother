using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CompBigBrother.Model;
using CompBigBrother.DatabaseAccessLayer;
namespace CompBigBrother.ViewModel
{
    class RoomViewModel : AbstractNotifyModel
    {
        private Room selectedRoom;
        public Room SelectedRoom 
        { 
            get => selectedRoom; 
            set 
            { 
                selectedRoom = value; 
                RaiseEvent(nameof(SelectedRoom)); 
            } 
        }

        public ObservableCollection<Room> Rooms { get; set; }
        public CustomModelCommand<Room> AddRoom { get; set; }
        public CustomModelCommand<DBNull> RefreshRooms { get; set; }
        public CustomModelCommand<DBNull> UpdateRooms { get; set; }
        public CustomModelCommand<Room> RemoveRoom { get; set; }

        public RoomViewModel()
        {
            RoomSql roomSql = new RoomSql();
            Rooms = new ObservableCollection<Room>(roomSql.GetAllRooms());
            AddRoom = new CustomModelCommand<Room>((r) =>
            {
                r = new Room { ID = MySQLMain.ShowNextId("rooms"), Num = "Новая комната" };
                Rooms.Add(r);
                roomSql.InsertRoom(r);
            });

            RefreshRooms = new CustomModelCommand<DBNull>((n) => 
            {
                Rooms = new ObservableCollection<Room>(roomSql.GetAllRooms());
                RaiseEvent(nameof(Rooms));
            });

            UpdateRooms = new CustomModelCommand<DBNull>((n) => 
            {
                foreach (Room room in Rooms)
                    roomSql.UpdateRoom(room);
            });

            RemoveRoom = new CustomModelCommand<Room>((r) =>
            {
                Rooms.Remove(r);
                roomSql.DeleteRoom(r);
            }, () => SelectedRoom != null);
        }
    }
}
