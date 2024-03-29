﻿using System;
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

        public Dictionary<int, string> RoomRelations { get; set; }
        public List<User> FilteredUsers { get; set; }
        public ObservableCollection<User> Users { get; set; }
        public CustomModelCommand<string> FilterUsers { get; set; }
        public CustomModelCommand<User> RefreshUsers { get; set; }
        public CustomModelCommand<DBNull> UpdateUsers { get; set; }
        public CustomModelCommand<User> AddUser { get; set; }
        public CustomModelCommand<User> RemoveUser { get; set; }

        public UserViewModel()
        {
            UserSql userSql = new UserSql();
            Users = new ObservableCollection<User>(userSql.GetAllUsers());
            FilteredUsers = new List<User>();
            UserType.GetAllUserTypes();
            RoomRelations = RoomSql.RoomsKeyValues;
            
            FilterUsers = new CustomModelCommand<string>((s) => 
            {
                FilteredUsers = Users.Where((u) => u.FirstName.Contains(s) || u.LastName.Contains(s)).ToList();
            });

            RefreshUsers = new CustomModelCommand<User>((u) => 
            {
                Users = new ObservableCollection<User>(userSql.GetAllUsers());
                RaiseEvent(nameof(Users));
            });

            UpdateUsers = new CustomModelCommand<DBNull>((n) => 
            {
                foreach (User user in Users)
                {
                    user.RoomID = RoomRelations.First((kv) => kv.Value == user.RoomValue).Key;
                    userSql.UpdateUser(user);
                }
            });

            AddUser = new CustomModelCommand<User>((u) =>
            {
                User user = new User { RoomID = 1, FirstName = "Имя", LastName = "Фамилия", ID = MySQLMain.ShowNextId("users"), UserTypeID = 1 };
                Users.Add(user);
                userSql.InsertUser(user);
            });

            RemoveUser = new CustomModelCommand<User>((u) =>
            {
                Users.Remove(u);
                userSql.DeleteUser(u);
            }, () => SelectedUser != null);
        }
    }
}
