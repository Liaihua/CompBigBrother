using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace CompBigBrother.Model
{
    public class CompComponent : AbstractNotifyModel
    {
        private int id;
        private string name;
        private float price;
        private int computerId;
        private int statusId;
        private string serialNumber;

        public int ID { get => id; set { id = value; RaiseEvent(nameof(ID)); } }
        public string Name { get => name; set { name = value; RaiseEvent(nameof(Name)); } }
        public float Price { get => price; set { price = value; RaiseEvent(nameof(Price)); } }
        public int ComputerID { get => computerId; set { computerId = value; RaiseEvent(nameof(ComputerID)); } }
        public int StatusID { get => statusId; set { statusId = value; RaiseEvent(nameof(StatusID)); } }
        public string SerialNumber { get => serialNumber; set { serialNumber = value; RaiseEvent(nameof(SerialNumber)); } }

    }
}
