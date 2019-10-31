using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace CompBigBrother
{
    public class CustomModelCommand<T> : ICommand where T : class
    {
        Action<T> action;
        Func<bool> check;
        public CustomModelCommand(Action<T> action, Func<bool> check = null)
        {
            this.action = action;
            this.check = check;
        }


        public event EventHandler CanExecuteChanged;

        public bool CanExecute(object parameter)
        {
            return true;
        }

        public void Execute(object parameter)
        {
            if (parameter != null)
                action((T)parameter);
            else
                action(null);
        }
    }
}
