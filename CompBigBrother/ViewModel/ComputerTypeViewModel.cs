using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Markup;
using CompBigBrother.Model;
namespace CompBigBrother.ViewModel
{
    class ComputerTypeViewModel : MarkupExtension
    {
        public override object ProvideValue(IServiceProvider serviceProvider)
        {
            return ComputerType.ComputerTypes.Values.ToList();
        }
    }
}
