using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using CompBigBrother.Model;
using CompBigBrother.ViewModel;
namespace CompBigBrother
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        ComputerViewModel ComputerViewModel { get; set; } = new ComputerViewModel();
        ComponentViewModel ComponentViewModel { get; set; } = new ComponentViewModel();
        UserViewModel UserViewModel { get; set; } = new UserViewModel();
        RoomViewModel RoomViewModel { get; set; } = new RoomViewModel();
        JournalViewModel JournalViewModel { get; set; } = new JournalViewModel();
        public MainWindow()
        {
            InitializeComponent();
            MySQLMain.SetupMySqlConnection();
            ComputerTab.DataContext = ComputerViewModel;
            ComponentTab.DataContext = ComponentViewModel;
            UserTab.DataContext = UserViewModel;
            RoomTab.DataContext = RoomViewModel;
            JournalTab.DataContext = JournalViewModel;
        }

        private void DatabaseConnectorWindow_Open(object sender, RoutedEventArgs e)
        {
            new DatabaseConnector().ShowDialog();
        }

        private void LoadDatabaseBackup_Click(object sender, RoutedEventArgs e)
        {

        }

        private void MakeDatabaseBackup_Click(object sender, RoutedEventArgs e)
        {

        }

        private void AboutWindow_Open(object sender, RoutedEventArgs e)
        {
            new View.AboutWindow().Show();
        }

        private void CloseMenuItem_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void ComputerDataGrid_SourceUpdated(object sender, DataTransferEventArgs e)
        {

        }

        private void SearchComputerByName_TextBlock_TextChanged(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(SearchComputerByName_TextBlock.Text))
                ComputerDataGrid.ItemsSource = ComputerViewModel.Computers;
            else
            {
                ComputerViewModel.FilterComputers.Execute(SearchComputerByName_TextBlock.Text);
                ComputerDataGrid.ItemsSource = ComputerViewModel.FilteredComputers;
            }
        }

        private void SearchComponentByName_TextBlock_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(SearchComponentByName_TextBlock.Text))
                ComponentDataGrid.ItemsSource = ComponentViewModel.Components;
            else
            {
                ComponentViewModel.FilterComponents.Execute(SearchComponentByName_TextBlock.Text);
                ComponentDataGrid.ItemsSource = ComponentViewModel.FilteredComponents;
            }
        }

        private void ExcelExportMenuItem_Click(object sender, RoutedEventArgs e)
        {
            DatabaseAccessLayer.ExcelExporter.ExportTables();
        }

        private void SearchUserByName_TextBlock_TextChanged(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(SearchUserByName_TextBlock.Text))
                UserDataGrid.ItemsSource = UserViewModel.Users;
            else
            {
                UserViewModel.FilterUsers.Execute(SearchUserByName_TextBlock.Text);
                UserDataGrid.ItemsSource = UserViewModel.FilteredUsers;
            }
        }
    }
}
