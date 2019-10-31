using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace CompBigBrother.ViewModel
{
    public class DatabaseSaveCommand : ICommand
    {
        Action action;

        public DatabaseSaveCommand(Action action)
        {
            this.action = action;
        }

        public event EventHandler CanExecuteChanged;

        public bool CanExecute(object parameter)
        {
            return true;
        }

        public void Execute(object parameter)
        {
            action();
        }
    }
}
