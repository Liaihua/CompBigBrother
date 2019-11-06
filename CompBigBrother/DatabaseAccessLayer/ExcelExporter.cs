using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NPOI.XSSF.UserModel;
using NPOI.SS.UserModel;
using Microsoft.Win32;
using System.IO;
using CompBigBrother.Model;

namespace CompBigBrother.DatabaseAccessLayer
{
    static class ExcelExporter
    {
        public static void ExportTables()
        {
            List<Computer> computers = new ComputerSql().GetAllComputers();
            List<CompComponent> components= new ComponentSql().GetAllComponents();
            List<User> users = new UserSql().GetAllUsers();
            List<Room> rooms = new RoomSql().GetAllRooms();

            string[] SheetNames = { "Компьютеры", "Запчасти и компоненты", "Пользователи", "Кабинеты" };
            IWorkbook workbook = new XSSFWorkbook();
            for (int i = 0; i < SheetNames.Length; i++)
                workbook.CreateSheet(SheetNames[i]);

            XSSFSheet CompSheet = workbook.GetSheetAt(0) as XSSFSheet;
            XSSFSheet ComponentSheet = workbook.GetSheetAt(1) as XSSFSheet;
            XSSFSheet UserSheet = workbook.GetSheetAt(2) as XSSFSheet;
            XSSFSheet RoomSheet = workbook.GetSheetAt(3) as XSSFSheet;

            
            IRow CompTitleRow = CompSheet.CreateRow(0) as XSSFRow;
            CompTitleRow.CreateCell(0).SetCellValue("№");
            CompTitleRow.CreateCell(1).SetCellValue("Название");
            CompTitleRow.CreateCell(2).SetCellValue("Цена");
            CompTitleRow.CreateCell(3).SetCellValue("Комната");
            CompTitleRow.CreateCell(4).SetCellValue("Серийный номер");
            CompTitleRow.CreateCell(5).SetCellValue("Статус");
            CompTitleRow.CreateCell(6).SetCellValue("Тип");
            

            for (int i = 0; i < computers.Count; i++)
            {
                IRow row = CompSheet.CreateRow(i + 1);
                row.CreateCell(0).SetCellValue(i + 1);
                row.CreateCell(1).SetCellValue(computers[i].Name);
                row.CreateCell(2).SetCellValue(computers[i].Price);
                row.CreateCell(3).SetCellValue(computers[i].RoomValue);
                row.CreateCell(4).SetCellValue(computers[i].SerialNumber);
                row.CreateCell(5).SetCellValue(computers[i].StatusValue);
                row.CreateCell(6).SetCellValue(computers[i].TypeValue);
            }

            IRow ComponentTitleRow = ComponentSheet.CreateRow(0); 
            
            ComponentTitleRow.CreateCell(0).SetCellValue("№");
            ComponentTitleRow.CreateCell(1).SetCellValue("Название");
            ComponentTitleRow.CreateCell(2).SetCellValue("Цена");
            ComponentTitleRow.CreateCell(3).SetCellValue("Серийный номер");
            ComponentTitleRow.CreateCell(4).SetCellValue("Статус");
            ComponentTitleRow.CreateCell(5).SetCellValue("Компьютер");

            for (int i = 0; i < components.Count; i++)
            {
                IRow row = ComponentSheet.CreateRow(i + 1);
                row.CreateCell(0).SetCellValue(i + 1);
                row.CreateCell(1).SetCellValue(components[i].Name);
                row.CreateCell(2).SetCellValue(components[i].Price);
                row.CreateCell(3).SetCellValue(components[i].SerialNumber);
                row.CreateCell(4).SetCellValue(components[i].StatusValue);
                row.CreateCell(5).SetCellValue(components[i].ComputerValue);
            }

            IRow UserTitleRow = UserSheet.CreateRow(0);

            UserTitleRow.CreateCell(0).SetCellValue("№");
            UserTitleRow.CreateCell(1).SetCellValue("Имя");
            UserTitleRow.CreateCell(2).SetCellValue("Фамилия");
            UserTitleRow.CreateCell(3).SetCellValue("Должность");
            UserTitleRow.CreateCell(4).SetCellValue("Кабинет");

            for (int i = 0; i < users.Count; i++)
            {
                IRow row = UserSheet.CreateRow(i + 1);
                row.CreateCell(0).SetCellValue(i + 1);
                row.CreateCell(1).SetCellValue(users[i].FirstName);
                row.CreateCell(2).SetCellValue(users[i].LastName);
                row.CreateCell(3).SetCellValue(users[i].UserTypeValue);
                row.CreateCell(4).SetCellValue(users[i].RoomValue);
            }

            IRow RoomTitleRow = RoomSheet.CreateRow(0);
            
            RoomTitleRow.CreateCell(0).SetCellValue("№");
            RoomTitleRow.CreateCell(1).SetCellValue("Название");
            
            for (int i = 0; i < rooms.Count; i++)
            {
                IRow row = RoomSheet.CreateRow(i + 1);
                row.CreateCell(0).SetCellValue(i + 1);
                row.CreateCell(1).SetCellValue(rooms[i].Num);
            }

            SaveFileDialog fileDialog = new SaveFileDialog();
            fileDialog.ShowDialog();
            using (FileStream fs = File.Create(fileDialog.FileName + ".xlsx"))
                workbook.Write(fs);
        }
    }
}
