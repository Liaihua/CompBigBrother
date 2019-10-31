using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompBigBrother.Model
{
    public class Room : AbstractNotifyModel
    {
        private int id;
        private string num;
        public int ID { get => id; set { id = value; RaiseEvent(nameof(ID)); } }
        public string Num { get => num; set { num = value; RaiseEvent(nameof(Num)); } }
    }
}
