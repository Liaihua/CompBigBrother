using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace CompBigBrother.Model
{
    public class User : AbstractNotifyModel
    {
        private int id;
        private string firstName;
        private string lastName;
        private int cabId;
        private int userTypeId;

        public int ID { get => id; set { id = value; RaiseEvent(nameof(ID)); } }
        public string FirstName { get => firstName; set { firstName = value; RaiseEvent(nameof(FirstName)); } }
        public string LastName { get => lastName; set { lastName = value; RaiseEvent(nameof(LastName)); } }
        public int CabID { get => cabId; set { cabId = value; RaiseEvent(nameof(CabID)); } }
        public int UserTypeID { get => userTypeId; set { userTypeId = value; RaiseEvent(nameof(UserType)); } }
        public string UserTypeValue { get => UserType.UserTypes[UserTypeID]; set {
                UserTypeID = UserType.UserTypes.First((s) => s.Value == value).Key;
            } }
    }
}
