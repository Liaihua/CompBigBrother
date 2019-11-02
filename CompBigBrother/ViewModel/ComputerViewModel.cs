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
    class ComputerViewModel : AbstractNotifyModel
    {
        private Computer selectedComputer;
        public Computer SelectedComputer
        {
            get => selectedComputer;
            set
            {
                selectedComputer = value;
                RaiseEvent(nameof(SelectedComputer));
            }
        }
        public ObservableCollection<Computer> Computers { get; set; }
        public List<Computer> FilteredComputers { get; set; }
        public CustomModelCommand<DBNull> RefreshComputers { get; set; }
        public CustomModelCommand<string> FilterComputers { get; set; }
        public CustomModelCommand<Computer> AddComputer { get; set; }
        public CustomModelCommand<Computer> UpdateComputers { get; set; }
        public CustomModelCommand<Computer> RemoveComputer { get; set; }

        public ComputerViewModel()
        {
            ComputerSql computerSql = new ComputerSql();
            Computers = new ObservableCollection<Computer>(computerSql.GetAllComputers());
            FilteredComputers = new List<Computer>();
            Status.GetAllStatuses();
            ComputerType.GetAllComputerTypes();
            AddComputer = new CustomModelCommand<Computer>((c) =>
            {
                Computer computer = new Computer() { ID = MySQLMain.ShowNextId("computers"), Name = "Новый компьютер", Price = 0, RoomID = 1, SerialNumber = "", StatusID = 1, TypeID = 1 };
                computerSql.InsertComputer(computer);
                Computers.Add(computer);
            });

            FilterComputers = new CustomModelCommand<string>((s) =>
            {
                FilteredComputers = Computers.Where((c) => c.Name.Contains(s) || c.SerialNumber.Contains(s)).ToList();
            });

            RefreshComputers = new CustomModelCommand<DBNull>((n) =>
            {
                Computers = new ObservableCollection<Computer>(computerSql.GetAllComputers());
                RaiseEvent(nameof(Computers));
            });

            UpdateComputers = new CustomModelCommand<Computer>((c) => // Недопил (???)
            {
                foreach(Computer computer in Computers)
                    computerSql.UpdateComputer(computer);
            });

            RemoveComputer = new CustomModelCommand<Computer>((c) =>
            {
                Computers.Remove(c);
                computerSql.Deletecomputer(c);
            }, () => SelectedComputer != null);
        }
    }
}
