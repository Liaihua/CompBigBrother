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
    class UserViewModel : AbstractNotifyModel
    {
        private User selectedUser;
        public User SelectedUser
        {
            get => selectedUser;
            set
            {
                selectedUser = value;
                RaiseEvent(nameof(SelectedUser));
            }
        }

        public ObservableCollection<User> FilterUsers { get; set; } = new ObservableCollection<User>();
        public ObservableCollection<User> Users { get; set; } = new ObservableCollection<User>();
        public CustomModelCommand<User> AddUser { get; set; }
        public CustomModelCommand<User> RemoveUser { get; set; }

        public UserViewModel()
        {
            AddUser = new CustomModelCommand<User>((u) =>
            {
                User user = new User { CabID = 1, FirstName = "Имя", LastName = "Фамилия", ID = MySQLMain.ShowNextId("users"), UserType = 1 };
                Users.Add(user);
            });

            RemoveUser = new CustomModelCommand<User>((u) =>
            {
                Users.Remove(u);
            }, () => SelectedUser != null);
        }
    }
}
