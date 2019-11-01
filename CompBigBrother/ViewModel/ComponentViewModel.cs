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
    class ComponentViewModel : AbstractNotifyModel
    {
        private CompComponent selectedComponent;
        public CompComponent SelectedComponent
        {
            get => selectedComponent;
            set 
            { 
                selectedComponent = value;
                RaiseEvent(nameof(SelectedComponent));
            }
        }
        public ObservableCollection<CompComponent> Components { get; set; }
        public CustomModelCommand<DBNull> RefreshComponents { get; set; }
        public CustomModelCommand<CompComponent> AddComponent { get; set; }
        public CustomModelCommand<CompComponent> UpdateComponents { get; set; }
        public CustomModelCommand<CompComponent> RemoveComponent { get; set; }

        public ComponentViewModel()
        {
            ComponentSql componentSql = new ComponentSql();
            Components = new ObservableCollection<CompComponent>(componentSql.GetAllComponents());
            AddComponent = new CustomModelCommand<CompComponent>((c) =>
            {
                CompComponent component = new CompComponent { ID = MySQLMain.ShowNextId("components"), Name = "Новый компонент", Price = 0, SerialNumber = "", StatusID = 1 };
                componentSql.InsertComponent(component);
                Components.Add(component);
            });

            RefreshComponents = new CustomModelCommand<DBNull>((n) => 
            {
                Components = new ObservableCollection<CompComponent>(componentSql.GetAllComponents());
                RaiseEvent(nameof(Components));
            });

            UpdateComponents = new CustomModelCommand<CompComponent>((c) =>
            {
                foreach (CompComponent component in Components)
                    componentSql.UpdateComponent(component);
            });

            RemoveComponent = new CustomModelCommand<CompComponent>((c) =>
            {
                Components.Remove(c);
                componentSql.DeleteComponent(c);
            }, () => SelectedComponent != null);
        }
    }
}
