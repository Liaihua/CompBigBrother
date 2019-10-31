using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CompBigBrother.Model;
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

        public ObservableCollection<Room> Rooms { get; set; } = new ObservableCollection<Room>();
        public CustomModelCommand<Room> AddRoom { get; set; }
        public CustomModelCommand<Room> RemoveRoom { get; set; }

        public RoomViewModel()
        {
            AddRoom = new CustomModelCommand<Room>((r) =>
            {
                Room room = new Room { ID = MySQLMain.ShowNextId("rooms"), Num = "1" };
                Rooms.Add(room);
            });

            RemoveRoom = new CustomModelCommand<Room>((r) =>
            {
                Rooms.Remove(r);
            }, () => SelectedRoom != null);
        }
    }
}
