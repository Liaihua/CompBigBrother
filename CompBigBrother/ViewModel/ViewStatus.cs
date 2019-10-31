using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Markup;

namespace CompBigBrother.ViewModel
{
    public class ViewStatus : MarkupExtension
    {
        public override object ProvideValue(IServiceProvider serviceProvider)
        {
            return Status.Statuses;
        }
    }
}
