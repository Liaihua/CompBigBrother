﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Markup;

namespace CompBigBrother.ViewModel
{
    class UserTypeViewModel : MarkupExtension
    {
        public override object ProvideValue(IServiceProvider serviceProvider)
        {
            return UserType.UserTypes.Values.ToList();
        }
    }
}
