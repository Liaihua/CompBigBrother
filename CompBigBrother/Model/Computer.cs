using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace CompBigBrother.Model
{
    public class Computer : AbstractNotifyModel
    {
        //Типы компьютеров (ПК, ноут, моноблок)
        //static Dictionary<int, string> ComputerTypes = ComputerType.GetAllComputerTypes();

        private int id;
        private string name;
        private string serialNumber;
        private float price;
        private int statusID;
        private int roomID;
        private int typeID;

        public int ID { get => id; set { id = value; RaiseEvent(nameof(ID)); } }
        public string Name { get => name; set { name = value; RaiseEvent(nameof(Name)); } }
        public string SerialNumber { get => serialNumber; set { serialNumber = value; RaiseEvent(nameof(SerialNumber)); } }
        public float Price { get => price; set { price = value; RaiseEvent(nameof(Price)); } }
        public int StatusID { get => statusID; set { statusID = value; RaiseEvent(nameof(StatusID)); } }
        public string StatusValue { get => Status.Statuses[statusID]; set {
                StatusID = Status.Statuses.First(s => s.Value == value).Key;  
            } }
        public int RoomID { get => roomID; set { roomID = value; RaiseEvent(nameof(RoomID)); } }
        //public string RoomValue { get => }
        public int TypeID { get => typeID; set { typeID = value; RaiseEvent(nameof(TypeID)); } }
        public string TypeValue { get => ComputerType.ComputerTypes[typeID]; }
    }
}
