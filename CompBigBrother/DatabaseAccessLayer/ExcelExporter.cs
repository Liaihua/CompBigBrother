using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NPOI.XSSF.UserModel;
using NPOI.SS.UserModel;
using Microsoft.Win32;
using System.IO;

namespace CompBigBrother.DatabaseAccessLayer
{
    static class ExcelExporter
    {
        public static void ExportTables()
        {
            IWorkbook workbook = new XSSFWorkbook();
            workbook.CreateSheet("Компьютеры");
            workbook.CreateSheet("Запчасти и компоненты");
            workbook.CreateSheet("Комнаты");
            workbook.CreateSheet("Пользователи");

            SaveFileDialog fileDialog = new SaveFileDialog();
            using (FileStream fs = File.Create(fileDialog.FileName))
                workbook.Write(fs);
        }
    }
}
