using CompBigBrother.ViewModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace CompBigBrother
{
    /// <summary>
    /// Логика взаимодействия для DatabaseConnector.xaml
    /// </summary>
    public partial class DatabaseConnector : Window
    {
        DatabaseConnectionOptions ConnectionOptions;
        public DatabaseConnector()
        {
            ConnectionOptions = DatabaseConnectionOptions.GetValues();
            InitializeComponent();
            DataContext = ConnectionOptions;
        }

        private void btn_saveMySql(object sender, RoutedEventArgs e)
        {
            ConnectionOptions.Save.Execute(null);
            MySQLMain.SetupMySqlConnection();
            
            // Здесь должна быть проверка на наличие уже существующего окна MainWindow
            new MainWindow().Show();
            Close();
        }

        private void btn_testMySql(object sender, RoutedEventArgs e)
        {
            ConnectionOptions.Save.Execute(null);
            MySQLMain.SetupMySqlConnection();
            if (MySQLMain.TestConnection())
                MessageBox.Show("OK");
        }
    }

    [DataContract]
    public class DatabaseConnectionOptions 
    {
        [DataMember]
        public string Server { get; set; }
        [DataMember]
        public string DB { get; set; }
        [DataMember]
        public string User { get; set; }
        [DataMember]
        public string Password { get; set; }

        public DatabaseSaveCommand Save { get { return new DatabaseSaveCommand(SetValues); } set { } }

        public DatabaseConnectionOptions()
        {
            Save = new DatabaseSaveCommand(() => SetValues());
        }

        public static DatabaseConnectionOptions GetValues()
        {
            if (!File.Exists("connection_settings.json"))
            {
                MessageBox.Show("Настройки подключения не указаны.\nСвязь с базой данных невозможна");
                return new DatabaseConnectionOptions();
            }
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(DatabaseConnectionOptions));
            DatabaseConnectionOptions LoadedOptions = null;
            using (FileStream fs = new FileStream("connection_settings.json", FileMode.Open, FileAccess.Read))
            {
                LoadedOptions = (DatabaseConnectionOptions)serializer.ReadObject(fs);
            }
            
            return LoadedOptions;
        }

        public void SetValues()
        {
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(DatabaseConnectionOptions));
            
            using (FileStream fs = new FileStream("connection_settings.json", FileMode.Create, FileAccess.Write))
            {
                serializer.WriteObject(fs, this);
            }
        }
    }
}
