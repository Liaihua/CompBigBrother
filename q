[1mdiff --git a/CompBigBrother/CompBigBrother.csproj b/CompBigBrother/CompBigBrother.csproj[m
[1mindex 77fb805..17e3338 100644[m
[1m--- a/CompBigBrother/CompBigBrother.csproj[m
[1m+++ b/CompBigBrother/CompBigBrother.csproj[m
[36m@@ -49,6 +49,9 @@[m
     <ErrorReport>prompt</ErrorReport>[m
     <WarningLevel>4</WarningLevel>[m
   </PropertyGroup>[m
[32m+[m[32m  <PropertyGroup>[m
[32m+[m[32m    <ApplicationIcon>Treetog-Junior-Computer-ok.ico</ApplicationIcon>[m
[32m+[m[32m  </PropertyGroup>[m
   <ItemGroup>[m
     <Reference Include="BouncyCastle.Crypto, Version=1.8.3.0, Culture=neutral, PublicKeyToken=0e99375e54769942">[m
       <HintPath>..\packages\BouncyCastle.1.8.3.1\lib\BouncyCastle.Crypto.dll</HintPath>[m
[36m@@ -214,5 +217,8 @@[m
   <ItemGroup>[m
     <WCFMetadata Include="Connected Services\" />[m
   </ItemGroup>[m
[32m+[m[32m  <ItemGroup>[m
[32m+[m[32m    <Resource Include="Treetog-Junior-Computer-ok.ico" />[m
[32m+[m[32m  </ItemGroup>[m
   <Import Project="$(MSBuildToolsPath)\Microsoft.CSharp.targets" />[m
 </Project>[m
\ No newline at end of file[m
[1mdiff --git a/CompBigBrother/DatabaseAccessLayer/ExcelExporter.cs b/CompBigBrother/DatabaseAccessLayer/ExcelExporter.cs[m
[1mindex 61e5d76..85af1f0 100644[m
[1m--- a/CompBigBrother/DatabaseAccessLayer/ExcelExporter.cs[m
[1m+++ b/CompBigBrother/DatabaseAccessLayer/ExcelExporter.cs[m
[36m@@ -47,7 +47,7 @@[m [mnamespace CompBigBrother.DatabaseAccessLayer[m
                 row.CreateCell(0).SetCellValue(i + 1);[m
                 row.CreateCell(1).SetCellValue(computers[i].Name);[m
                 row.CreateCell(2).SetCellValue(computers[i].Price);[m
[31m-                row.CreateCell(3).SetCellValue(computers[i].RoomID);[m
[32m+[m[32m                row.CreateCell(3).SetCellValue(computers[i].RoomValue);[m
                 row.CreateCell(4).SetCellValue(computers[i].SerialNumber);[m
                 row.CreateCell(5).SetCellValue(computers[i].StatusValue);[m
                 row.CreateCell(6).SetCellValue(computers[i].TypeValue);[m
[1mdiff --git a/CompBigBrother/Properties/enslaved_computer.jpg b/CompBigBrother/Properties/enslaved_computer.jpg[m
[1mdeleted file mode 100644[m
[1mindex e1efb5d..0000000[m
Binary files a/CompBigBrother/Properties/enslaved_computer.jpg and /dev/null differ
[1mdiff --git a/CompBigBrother/View/AboutWindow.xaml b/CompBigBrother/View/AboutWindow.xaml[m
[1mindex 6b61097..7a1d4b0 100644[m
[1m--- a/CompBigBrother/View/AboutWindow.xaml[m
[1m+++ b/CompBigBrother/View/AboutWindow.xaml[m
[36m@@ -25,6 +25,6 @@[m
             <TextBlock Grid.Row="0" Text="(a. k. a. Computers' Big Brother and The Warrior of The Her Majesty Bureaucracy" FontSize="12px" FontStyle="Normal"/>[m
             <TextBlock Grid.Row="0" Text="Авторство: Вовченко И., гр. 1131. Все права не защищены" FontSize="12px" FontStyle="Normal"/>[m
         </StackPanel>[m
[31m-        <Image Grid.Row="1" Source="enslaved_computer.jpg" Margin="24"/>[m
[32m+[m[32m        <Image Grid.Row="1" Source="/enslaved_computer.jpg" Margin="24"/>[m
     </Grid>[m
 </Window>[m
[1mdiff --git a/CompBigBrother/View/MainWindow.xaml b/CompBigBrother/View/MainWindow.xaml[m
[1mindex 3363658..418c626 100644[m
[1m--- a/CompBigBrother/View/MainWindow.xaml[m
[1m+++ b/CompBigBrother/View/MainWindow.xaml[m
[36m@@ -175,12 +175,12 @@[m
                             <DataGridTemplateColumn Header="Кабинет">[m
                                 <DataGridTemplateColumn.CellTemplate>[m
                                     <DataTemplate>[m
[31m-                                        <TextBlock Text="{Binding RoomValue}"/>[m
[32m+[m[32m                                        <TextBlock Text="{Binding CabValue}"/>[m
                                     </DataTemplate>[m
                                 </DataGridTemplateColumn.CellTemplate>[m
                                 <DataGridTemplateColumn.CellEditingTemplate>[m
                                     <DataTemplate>[m
[31m-                                        <ComboBox ItemsSource="{view:RoomKeyValueViewModel}" SelectedItem="{Binding RoomValue}"/>[m
[32m+[m[32m                                        <ComboBox ItemsSource="{view:RoomKeyValueViewModel}" SelectedItem="{Binding CabValue}"/>[m
                                     </DataTemplate>[m
                                 </DataGridTemplateColumn.CellEditingTemplate>[m
                             </DataGridTemplateColumn>[m
[1mdiff --git a/vov.sql.txt b/vov.sql.txt[m
[1mdeleted file mode 100644[m
[1mindex 76635ae..0000000[m
[1m--- a/vov.sql.txt[m
[1m+++ /dev/null[m
[36m@@ -1,605 +0,0 @@[m
[31m--- MySqlBackup.NET 2.3.1[m
[31m--- Dump Time: 2019-11-05 15:24:20[m
[31m--- --------------------------------------[m
[31m--- Server version 5.5.28 MySQL Community Server (GPL)[m
[31m-[m
[31m-[m
[31m-/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;[m
[31m-/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;[m
[31m-/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;[m
[31m-/*!40101 SET NAMES utf8 */;[m
[31m-/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;[m
[31m-/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;[m
[31m-/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;[m
[31m-/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;[m
[31m-[m
[31m-[m
[31m--- [m
[31m--- Definition of meta_computer_type[m
[31m--- [m
[31m-[m
[31m-DROP TABLE IF EXISTS `meta_computer_type`;[m
[31m-CREATE TABLE IF NOT EXISTS `meta_computer_type` ([m
[31m-  `id` int(32) NOT NULL AUTO_INCREMENT,[m
[31m-  `type_name` varchar(32) NOT NULL,[m
[31m-  PRIMARY KEY (`id`)[m
[31m-) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;[m
[31m-[m
[31m--- [m
[31m--- Dumping data for table meta_computer_type[m
[31m--- [m
[31m-[m
[31m-/*!40000 ALTER TABLE `meta_computer_type` DISABLE KEYS */;[m
[31m-INSERT INTO `meta_computer_type`(`id`,`type_name`) VALUES[m
[31m-(-1,'Не задан'),[m
[31m-(1,'Стационарный компьютер'),[m
[31m-(2,'Моноблок'),[m
[31m-(3,'Ноутбук');[m
[31m-/*!40000 ALTER TABLE `meta_computer_type` ENABLE KEYS */;[m
[31m-[m
[31m--- [m
[31m--- Definition of meta_log_object[m
[31m--- [m
[31m-[m
[31m-DROP TABLE IF EXISTS `meta_log_object`;[m
[31m-CREATE TABLE IF NOT EXISTS `meta_log_object` ([m
[31m-  `id` int(32) NOT NULL AUTO_INCREMENT,[m
[31m-  `type` varchar(50) NOT NULL,[m
[31m-  PRIMARY KEY (`id`)[m
[31m-) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;[m
[31m-[m
[31m--- [m
[31m--- Dumping data for table meta_log_object[m
[31m--- [m
[31m-[m
[31m-/*!40000 ALTER TABLE `meta_log_object` DISABLE KEYS */;[m
[31m-INSERT INTO `meta_log_object`(`id`,`type`) VALUES[m
[31m-(1,'Пользователь'),[m
[31m-(2,'Компьютер'),[m
[31m-(3,'Запчасти'),[m
[31m-(4,'Кабинет');[m
[31m-/*!40000 ALTER TABLE `meta_log_object` ENABLE KEYS */;[m
[31m-[m
[31m--- [m
[31m--- Definition of journal[m
[31m--- [m
[31m-[m
[31m-DROP TABLE IF EXISTS `journal`;[m
[31m-CREATE TABLE IF NOT EXISTS `journal` ([m
[31m-  `id` int(32) NOT NULL AUTO_INCREMENT,[m
[31m-  `log_type` int(32) NOT NULL,[m
[31m-  `date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,[m
[31m-  `info` text NOT NULL,[m
[31m-  PRIMARY KEY (`id`),[m
[31m-  KEY `journal_ibfk_1` (`log_type`),[m
[31m-  CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`log_type`) REFERENCES `meta_log_object` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION[m
[31m-) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8;[m
[31m-[m
[31m--- [m
[31m--- Dumping data for table journal[m
[31m--- [m
[31m-[m
[31m-/*!40000 ALTER TABLE `journal` DISABLE KEYS */;[m
[31m-INSERT INTO `journal`(`id`,`log_type`,`date_time`,`info`) VALUES[m
[31m-(8,2,'2019-10-28 03:00:11','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),[m
[31m-(9,2,'2019-10-28 03:01:35','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),[m
[31m-(10,2,'2019-10-28 03:23:42','inserted Новый компьютер with ID = 0'),[m
[31m-(11,2,'2019-10-28 03:34:05','inserted Новый компьютер with ID = 0'),[m
[31m-(12,2,'2019-10-29 04:24:22','inserted Новый компьютер with ID = 0'),[m
[31m-(13,2,'2019-10-29 04:24:22','inserted Новый компьютер with ID = 0'),[m
[31m-(14,2,'2019-10-29 04:24:23','inserted Новый компьютер with ID = 0'),[m
[31m-(15,2,'2019-10-29 04:24:50','inserted Новый компьютер with ID = 0'),[m
[31m-(16,2,'2019-10-29 04:24:51','inserted Новый компьютер with ID = 0'),[m
[31m-(17,2,'2019-10-29 04:24:52','inserted Новый компьютер with ID = 0'),[m
[31m-(18,2,'2019-10-29 04:24:52','inserted Новый компьютер with ID = 0'),[m
[31m-(19,2,'2019-10-29 04:24:53','inserted Новый компьютер with ID = 0'),[m
[31m-(20,2,'2019-10-29 04:24:55','inserted Новый компьютер with ID = 0'),[m
[31m-(21,2,'2019-10-29 04:24:56','inserted Новый компьютер with ID = 0'),[m
[31m-(22,2,'2019-10-29 04:24:57','inserted Новый компьютер with ID = 0'),[m
[31m-(23,2,'2019-10-29 04:24:58','inserted Новый компьютер with ID = 0'),[m
[31m-(24,2,'2019-10-31 00:16:49','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),[m
[31m-(25,2,'2019-10-31 00:16:49','updated computer from asd to asd with ID = 2'),[m
[31m-(26,2,'2019-10-31 00:16:49','updated computer from asd1 to asd1 with ID = 3'),[m
[31m-(27,2,'2019-10-31 00:16:49','updated computer from asd1 to asd1 with ID = 4'),[m
[31m-(28,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 6'),[m
[31m-(29,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Test with ID = 7'),[m
[31m-(30,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 8'),[m
[31m-(31,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 9'),[m
[31m-(32,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 10'),[m
[31m-(33,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 11'),[m
[31m-(34,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 12'),[m
[31m-(35,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 13'),[m
[31m-(36,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 14'),[m
[31m-(37,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 15'),[m
[31m-(38,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 16'),[m
[31m-(39,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 17'),[m
[31m-(40,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 18'),[m
[31m-(41,2,'2019-10-31 00:16:49','updated computer from Новый компьютер to Новый компьютер with ID = 19'),[m
[31m-(42,2,'2019-10-31 00:17:09','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),[m
[31m-(43,2,'2019-10-31 00:17:09','updated computer from asd to asd with ID = 2'),[m
[31m-(44,2,'2019-10-31 00:17:09','updated computer from asd1 to asd1 with ID = 3'),[m
[31m-(45,2,'2019-10-31 00:17:09','updated computer from asd1 to asd1 with ID = 4'),[m
[31m-(46,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 6'),[m
[31m-(47,2,'2019-10-31 00:17:09','updated computer from Test to Test with ID = 7'),[m
[31m-(48,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 8'),[m
[31m-(49,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 9'),[m
[31m-(50,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 10'),[m
[31m-(51,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 11'),[m
[31m-(52,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to heelppp with ID = 12'),[m
[31m-(53,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 13'),[m
[31m-(54,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 14'),[m
[31m-(55,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 15'),[m
[31m-(56,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 16'),[m
[31m-(57,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 17'),[m
[31m-(58,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 18'),[m
[31m-(59,2,'2019-10-31 00:17:09','updated computer from Новый компьютер to Новый компьютер with ID = 19'),[m
[31m-(60,2,'2019-10-31 00:25:41','updated computer from Новый компьютер to МЕГАКАМПУКТЕР with ID = 19'),[m
[31m-(62,2,'2019-10-31 00:32:40','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),[m
[31m-(63,2,'2019-10-31 00:39:18','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),[m
[31m-(64,2,'2019-10-31 00:39:18','updated computer from asd to asd with ID = 2'),[m
[31m-(65,2,'2019-10-31 00:39:18','updated computer from asd1 to asd1 with ID = 3'),[m
[31m-(66,2,'2019-10-31 00:39:18','updated computer from asd1 to asd1 with ID = 4'),[m
[31m-(67,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 6'),[m
[31m-(68,2,'2019-10-31 00:39:18','updated computer from Test to Test with ID = 7'),[m
[31m-(69,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 8'),[m
[31m-(70,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 9'),[m
[31m-(71,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 10'),[m
[31m-(72,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 11'),[m
[31m-(73,2,'2019-10-31 00:39:18','updated computer from heelppp to heelppp with ID = 12'),[m
[31m-(74,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 13'),[m
[31m-(75,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 14'),[m
[31m-(76,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 15'),[m
[31m-(77,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 16'),[m
[31m-(78,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 17'),[m
[31m-(79,2,'2019-10-31 00:39:18','updated computer from Новый компьютер to Новый компьютер with ID = 18'),[m
[31m-(80,2,'2019-10-31 00:39:18','updated computer from МЕГАКАМПУКТЕР to МЕГАКАМПУКТЕР with ID = 19'),[m
[31m-(81,2,'2019-10-31 00:40:01','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),[m
[31m-(82,2,'2019-10-31 00:40:01','updated computer from asd to asd with ID = 2'),[m
[31m-(83,2,'2019-10-31 00:40:01','updated computer from asd1 to asd1 with ID = 3'),[m
[31m-(84,2,'2019-10-31 00:40:01','updated computer from asd1 to asd1 with ID = 4'),[m
[31m-(85,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 6'),[m
[31m-(86,2,'2019-10-31 00:40:01','updated computer from Test to Test with ID = 7'),[m
[31m-(87,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 8'),[m
[31m-(88,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 9'),[m
[31m-(89,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 10'),[m
[31m-(90,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 11'),[m
[31m-(91,2,'2019-10-31 00:40:01','updated computer from heelppp to heelppp with ID = 12'),[m
[31m-(92,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 13'),[m
[31m-(93,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 14'),[m
[31m-(94,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 15'),[m
[31m-(95,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 16'),[m
[31m-(96,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 17'),[m
[31m-(97,2,'2019-10-31 00:40:01','updated computer from Новый компьютер to Новый компьютер with ID = 18'),[m
[31m-(98,2,'2019-10-31 00:40:01','updated computer from МЕГАКАМПУКТЕР to МЕГАКАМПУКТЕР with ID = 19'),[m
[31m-(103,2,'2019-10-31 01:40:04','deleted asd1 with ID = 4'),[m
[31m-(104,2,'2019-10-31 01:40:07','deleted МЕГАКАМПУКТЕР with ID = 19'),[m
[31m-(105,2,'2019-10-31 01:40:31','updated computer from СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 to СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),[m
[31m-(106,2,'2019-10-31 01:40:31','updated computer from asd to asd with ID = 2'),[m
[31m-(107,2,'2019-10-31 01:40:31','updated computer from asd1 to asd1 with ID = 3'),[m
[31m-(108,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 6'),[m
[31m-(109,2,'2019-10-31 01:40:31','updated computer from Test to Test with ID = 7'),[m
[31m-(110,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 8'),[m
[31m-(111,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 9'),[m
[31m-(112,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 10'),[m
[31m-(113,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 11'),[m
[31m-(114,2,'2019-10-31 01:40:31','updated computer from heelppp to heelppp with ID = 12'),[m
[31m-(115,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 13'),[m
[31m-(116,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 14'),[m
[31m-(117,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 15'),[m
[31m-(118,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 16'),[m
[31m-(119,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 17'),[m
[31m-(120,2,'2019-10-31 01:40:31','updated computer from Новый компьютер to Новый компьютер with ID = 18'),[m
[31m-(121,3,'2019-10-31 01:47:48','updated from Диал-ап из 80-х to Диал-ап из 80-х with ID = 1'),[m
[31m-(122,2,'2019-10-31 01:47:48','deleted СУПЕР МОЩЫНЫЙ ПЕКА!!1!!АДИН!!1 with ID = 1'),[m
[31m-(123,2,'2019-10-31 01:47:54','updated computer from asd to asd with ID = 2'),[m
[31m-(124,2,'2019-10-31 01:47:54','updated computer from asd1 to asd1 with ID = 3'),[m
[31m-(125,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 6'),[m
[31m-(126,2,'2019-10-31 01:47:54','updated computer from Test to Test with ID = 7'),[m
[31m-(127,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 8'),[m
[31m-(128,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 9'),[m
[31m-(129,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 10'),[m
[31m-(130,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 11'),[m
[31m-(131,2,'2019-10-31 01:47:54','updated computer from heelppp to heelppp with ID = 12'),[m
[31m-(132,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 13'),[m
[31m-(133,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 14'),[m
[31m-(134,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 15'),[m
[31m-(135,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 16'),[m
[31m-(136,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 17'),[m
[31m-(137,2,'2019-10-31 01:47:54','updated computer from Новый компьютер to Новый компьютер with ID = 18'),[m
[31m-(138,2,'2019-10-31 01:47:56','updated computer from asd to asd with ID = 2'),[m
[31m-(139,2,'2019-10-31 01:47:56','updated computer from asd1 to asd1 with ID = 3'),[m
[31m-(140,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 6'),[m
[31m-(141,2,'2019-10-31 01:47:56','updated computer from Test to Test with ID = 7'),[m
[31m-(142,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 8'),[m
[31m-(143,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 9'),[m
[31m-(144,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 10'),[m
[31m-(145,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 11'),[m
[31m-(146,2,'2019-10-31 01:47:56','updated computer from heelppp to heelppp with ID = 12'),[m
[31m-(147,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 13'),[m
[31m-(148,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 14'),[m
[31m-(149,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 15'),[m
[31m-(150,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 16'),[m
[31m-(151,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 17'),[m
[31m-(152,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 18'),[m
[31m-(153,2,'2019-10-31 01:47:56','updated computer from asd to asd with ID = 2'),[m
[31m-(154,2,'2019-10-31 01:47:56','updated computer from asd1 to asd1 with ID = 3'),[m
[31m-(155,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 6'),[m
[31m-(156,2,'2019-10-31 01:47:56','updated computer from Test to Test with ID = 7'),[m
[31m-(157,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 8'),[m
[31m-(158,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 9'),[m
[31m-(159,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 10'),[m
[31m-(160,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 11'),[m
[31m-(161,2,'2019-10-31 01:47:56','updated computer from heelppp to heelppp with ID = 12'),[m
[31m-(162,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 13'),[m
[31m-(163,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 14'),[m
[31m-(164,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 15'),[m
[31m-(165,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 16'),[m
[31m-(166,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 17'),[m
[31m-(167,2,'2019-10-31 01:47:56','updated computer from Новый компьютер to Новый компьютер with ID = 18'),[m
[31m-(168,3,'2019-10-31 01:49:21','updated from Диал-ап из 80-х to Диал-ап из 80-х with ID = 1'),[m
[31m-(169,2,'2019-10-31 01:49:48','updated computer from asd to asdd with ID = 2'),[m
[31m-(170,2,'2019-10-31 01:49:48','updated computer from asd1 to asd1 with ID = 3'),[m
[31m-(171,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 6'),[m
[31m-(172,2,'2019-10-31 01:49:48','updated computer from Test to Test with ID = 7'),[m
[31m-(173,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 8'),[m
[31m-(174,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 9'),[m
[31m-(175,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 10'),[m
[31m-(176,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 11'),[m
[31m-(177,2,'2019-10-31 01:49:48','updated computer from heelppp to heelppp with ID = 12'),[m
[31m-(178,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 13'),[m
[31m-(179,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 14'),[m
[31m-(180,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 15'),[m
[31m-(181,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 16'),[m
[31m-(182,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 17'),[m
[31m-(183,2,'2019-10-31 01:49:48','updated computer from Новый компьютер to Новый компьютер with ID = 18'),[m
[31m-(184,2,'2019-10-31 01:51:50','updated computer from asdd to asddf with ID = 2'),[m
[31m-(185,2,'2019-10-31 01:51:50','updated computer from asd1 to asd1 with ID = 3'),[m
[31m-(186,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 6'),[m
[31m-(187,2,'2019-10-31 01:51:50','updated computer from Test to Test with ID = 7'),[m
[31m-(188,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 8'),[m
[31m-(189,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 9'),[m
[31m-(190,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 10'),[m
[31m-(191,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 11'),[m
[31m-(192,2,'2019-10-31 01:51:50','updated computer from heelppp to heelppp with ID = 12'),[m
[31m-(193,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 13'),[m
[31m-(194,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 14'),[m
[31m-(195,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 15'),[m
[31m-(196,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 16'),[m
[31m-(197,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 17'),[m
[31m-(198,2,'2019-10-31 01:51:50','updated computer from Новый компьютер to Новый компьютер with ID = 18'),[m
[31m-(199,2,'2019-10-31 04:18:21','updated computer from asddf to asddf with ID = 2'),[m
[31m-(200,2,'2019-10-31 04:18:21','updated computer from asd1 to asd1 with ID = 3'),[m
[31m-(201,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to GLADOS with ID = 6'),[m
[31m-(202,2,'2019-10-31 04:18:21','updated computer from Test to Test with ID = 7'),[m
[31m-(203,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 8'),[m
[31m-(204,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 9'),[m
[31m-(205,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 10'),[m
[31m-(206,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 11'),[m
[31m-(207,2,'2019-10-31 04:18:21','updated computer from heelppp to heelppp with ID = 12'),[m
[31m-(208,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 13'),[m
[31m-(209,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 14'),[m
[31m-(210,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 15'),[m
[31m-(211,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 16'),[m
[31m-(212,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 17'),[m
[31m-(213,2,'2019-10-31 04:18:21','updated computer from Новый компьютер to Новый компьютер with ID = 18'),[m
[31m-(214,2,'2019-10-31 04:30:20','updated computer from GLaDOS to Whitley with ID = 6'),[m
[31m-(215,2,'2019-11-01 01:14:15','inserted Новый компьютер with ID = 0'),[m
[31m-(216,1,'2019-11-01 01:25:02','inserted Имя Фамилия with ID = 0'),[m
[31m-(217,4,'2019-11-01 01:25:04','inserted Новая комната with ID = 0'),[m
[31m-(218,2,'2019-11-01 01:40:07','updated computer from Новый компьютер to '' select * from users; -- with ID = 20'),[m
[31m-(219,2,'2019-11-01 02:04:58','updated computer from '' select * from users; -- to UPDATE with ID = 20'),[m
[31m-(220,2,'2019-11-01 02:12:01','updated computer from UPDATE to HEKO with ID = 20'),[m
[31m-(230,3,'2019-11-01 02:38:21','inserted Перчатка Хакермена with ID = 0'),[m
[31m-(231,3,'2019-11-01 02:42:53','inserted VVVVVV with ID = 0'),[m
[31m-(233,2,'2019-11-01 02:55:01','inserted default computer with ID = 0'),[m
[31m-(234,4,'2019-11-01 02:55:50','inserted Без комнаты with ID = -1'),[m
[31m-(235,2,'2019-11-01 02:56:18','updated computer from default computer to Без компьютера with ID = -1'),[m
[31m-(236,3,'2019-11-01 02:57:43','inserted Новый компонент with ID = 0'),[m
[31m-(237,2,'2019-11-01 02:59:27','updated computer from HEKO to y with ID = 20'),[m
[31m-(238,2,'2019-11-01 03:06:46','updated computer from y to GGG with ID = 20'),[m
[31m-(239,2,'2019-11-01 03:09:13','updated computer from GGG to GGWP with ID = 20'),[m
[31m-(240,3,'2019-11-01 03:10:14','updated from Новый компонент to Старый компонент with ID = 14'),[m
[31m-(241,2,'2019-11-01 03:13:50','deleted GGWP with ID = 20'),[m
[31m-(242,1,'2019-11-01 03:19:26','inserted Имя Фамилия with ID = 0'),[m
[31m-(243,4,'2019-11-01 03:58:22','inserted Новая комната with ID = 0'),[m
[31m-(244,4,'2019-11-01 03:58:26','inserted Новая комната with ID = 0'),[m
[31m-(245,4,'2019-11-01 03:58:57','updated from Новая комната to Кладовая with ID = 2'),[m
[31m-(246,4,'2019-11-01 03:59:08','updated from Новая комната to Серверная with ID = 3'),[m
[31m-(247,4,'2019-11-01 03:59:32','updated from Новая комната to Злые бухгалтеры with ID = 4'),[m
[31m-(248,4,'2019-11-01 04:08:42','updated from Буфет to Хавалка with ID = 1'),[m
[31m-(249,2,'2019-11-01 04:33:41','deleted Новый компьютер with ID = 18'),[m
[31m-(250,3,'2019-11-01 04:33:44','deleted Старый компонент with ID = 14'),[m
[31m-(251,1,'2019-11-01 04:33:48','deleted Имя Фамилия with ID = 3'),[m
[31m-(252,1,'2019-11-01 04:33:50','inserted Имя Фамилия with ID = 0'),[m
[31m-(253,1,'2019-11-01 04:33:52','deleted Имя Фамилия with ID = 4'),[m
[31m-(254,1,'2019-11-05 04:37:32','updated from Томас Андерсон to Томас Андерсон with ID = 1'),[m
[31m-(255,2,'2019-11-05 04:37:59','inserted Новый компьютер with ID = 0'),[m
[31m-(256,3,'2019-11-05 04:38:01','inserted Новый компонент with ID = 0'),[m
[31m-(257,1,'2019-11-05 04:38:04','inserted Имя Фамилия with ID = 0'),[m
[31m-(258,4,'2019-11-05 04:38:06','inserted Новая комната with ID = 0'),[m
[31m-(259,2,'2019-11-05 04:55:41','updated computer from Без компьютера to Без компьютера with ID = -1'),[m
[31m-(260,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 8'),[m
[31m-(261,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 9'),[m
[31m-(262,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 10'),[m
[31m-(263,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 11'),[m
[31m-(264,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 13'),[m
[31m-(265,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 14'),[m
[31m-(266,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 15'),[m
[31m-(267,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 16'),[m
[31m-(268,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 17'),[m
[31m-(269,2,'2019-11-05 04:57:03','updated computer from Новый компьютер to Новый компьютер with ID = 18');[m
[31m-/*!40000 ALTER TABLE `journal` ENABLE KEYS */;[m
[31m-[m
[31m--- [m
[31m--- Definition of meta_status[m
[31m--- [m
[31m-[m
[31m-DROP TABLE IF EXISTS `meta_status`;[m
[31m-CREATE TABLE IF NOT EXISTS `meta_status` ([m
[31m-  `id` int(32) NOT NULL AUTO_INCREMENT,[m
[31m-  `status_name` varchar(32) NOT NULL,[m
[31m-  PRIMARY KEY (`id`)[m
[31m-) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;[m
[31m-[m
[31m--- [m
[31m--- Dumping data for table meta_status[m
[31m--- [m
[31m-[m
[31m-/*!40000 ALTER TABLE `meta_status` DISABLE KEYS */;[m
[31m-INSERT INTO `meta_status`(`id`,`status_name`) VALUES[m
[31m-(-1,'Неизвестно'),[m
[31m-(1,'Работает'),[m
[31m-(2,'Сломан'),[m
[31m-(3,'На ремонте'),[m
[31m-(4,'Отремонтирован'),[m
[31m-(5,'Списан');[m
[31m-/*!40000 ALTER TABLE `meta_status` ENABLE KEYS */;[m
[31m-[m
[31m--- [m
[31m--- Definition of components[m
[31m--- [m
[31m-[m
[31m-DROP TABLE IF EXISTS `components`;[m
[31m-CREATE TABLE IF NOT EXISTS `components` ([m
[31m-  `id` int(32) NOT NULL AUTO_INCREMENT,[m
[31m-  `component_name` varchar(50) NOT NULL,[m
[31m-  `component_price` decimal(32,2) NOT NULL,[m
[31m-  `computer_id` int(32) DEFAULT NULL,[m
[31m-  `status` int(32) NOT NULL,[m
[31m-  `serial_number` varchar(32) NOT NULL,[m
[31m-  PRIMARY KEY (`id`),[m
[31m-  KEY `computer_id` (`computer_id`) USING BTREE,[m
[31m-  KEY `status` (`status`),[m
[31m-  CONSTRAINT `components_ibfk_1` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`id`),[m
[31m-  CONSTRAINT `components_ibfk_2` FOREIGN KEY (`status`) REFERENCES `meta_status` (`id`)[m
[31m-) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;[m
[31m-[m
[31m--- [m
[31m--- Dumping data for table components[m
[31m--- [m
[31m-[m
[31m-/*!40000 ALTER TABLE `components` DISABLE KEYS */;[m
[31m-INSERT INTO `components`(`id`,`component_name`,`component_price`,`computer_id`,`status`,`serial_number`) VALUES[m
[31m-(1,'Диал-ап из 80-х',464367600.00,3,1,'1BADB002'),[m
[31m-(11,'Перчатка Хакермена',142.22,2,1,'HACKTIME'),[m
[31m-(12,'VVVVVV',1.01,6,1,'HELP'),[m
[31m-(13,'Новый компонент',0.00,-1,1,'');[m
[31m-/*!40000 ALTER TABLE `components` ENABLE KEYS */;[m
[31m-[m
[31m--- [m
[31m--- Definition of meta_user_type[m
[31m--- [m
[31m-[m
[31m-DROP TABLE IF EXISTS `meta_user_type`;[m
[31m-CREATE TABLE IF NOT EXISTS `meta_user_type` ([m
[31m-  `id` int(32) NOT NULL AUTO_INCREMENT,[m
[31m-  `type` varchar(32) NOT NULL,[m
[31m-  PRIMARY KEY (`id`)[m
[31m-) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;[m
[31m-[m
[31m--- [m
[31m--- Dumping data for table meta_user_type[m
[31m--- [m
[31m-[m
[31m-/*!40000 ALTER TABLE `meta_user_type` DISABLE KEYS */;[m
[31m-INSERT INTO `meta_user_type`(`id`,`type`) VALUES[m
[31m-(-1,'Не задан'),[m
[31m-(1,'Администратор'),[m
[31m-(2,'Бухгалтер');[m
[31m-/*!40000 ALTER TABLE `meta_user_type` ENABLE KEYS */;[m
[31m-[m
[31m--- [m
[31m--- Definition of rooms[m
[31m--- [m
[31m-[m
[31m-DROP TABLE IF EXISTS `rooms`;[m
[31m-CREATE TABLE IF NOT EXISTS `rooms` ([m
[31m-  `id` int(32) NOT NULL AUTO_INCREMENT,[m
[31m-  `room_name` char(16) NOT NULL,[m
[31m-  PRIMARY KEY (`id`)[m
[31m-) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;[m
[31m-[m
[31m--- [m
[31m--- Dumping data for table rooms[m
[31m--- [m
[31m-[m
[31m-/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;[m
[31m-INSERT INTO `rooms`(`id`,`room_name`) VALUES[m
[31m-(-1,'Без комнаты'),[m
[31m-(1,'Хавалка'),[m
[31m-(2,'Кладовая'),[m
[31m-(3,'Серверная'),[m
[31m-(4,'Злые бухгалтеры'),[m
[31m-(5,'Новая комната');[m
[31m-/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;[m
[31m-[m
[31m--- [m
[31m--- Definition of computers[m
[31m--- [m
[31m-[m
[31m-DROP TABLE IF EXISTS `computers`;[m
[31m-CREATE TABLE IF NOT EXISTS `computers` ([m
[31m-  `id` int(32) NOT NULL AUTO_INCREMENT,[m
[31m-  `computer_name` varchar(32) NOT NULL,[m
[31m-  `price` float(32,2) NOT NULL,[m
[31m-  `serial_number` varchar(32) NOT NULL,[m
[31m-  `status` int(32) NOT NULL DEFAULT '1',[m
[31m-  `room_id` int(32) NOT NULL,[m
[31m-  `type` int(32) NOT NULL,[m
[31m-  PRIMARY KEY (`id`),[m
[31m-  KEY `computers_ibfk_1` (`type`),[m
[31m-  KEY `computers_ibfk_2` (`status`),[m
[31m-  KEY `computers_ibfk_3` (`room_id`),[m
[31m-  CONSTRAINT `computers_ibfk_1` FOREIGN KEY (`type`) REFERENCES `meta_computer_type` (`id`),[m
[31m-  CONSTRAINT `computers_ibfk_2` FOREIGN KEY (`status`) REFERENCES `meta_status` (`id`),[m
[31m-  CONSTRAINT `computers_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)[m
[31m-) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;[m
[31m-[m
[31m--- [m
[31m--- Dumping data for table computers[m
[31m--- [m
[31m-[m
[31m-/*!40000 ALTER TABLE `computers` DISABLE KEYS */;[m
[31m-INSERT INTO `computers`(`id`,`computer_name`,`price`,`serial_number`,`status`,`room_id`,`type`) VALUES[m
[31m-(-1,'Без компьютера',-1,'-1',1,-1,1),[m
[31m-(2,'asddf',1,'asd',1,1,1),[m
[31m-(3,'asd1',1,'asd',4,1,1),[m
[31m-(6,'Whitley',0,'',1,1,1),[m
[31m-(7,'Test',0,'',1,1,1),[m
[31m-(8,'Новый компьютер',0,'',3,-1,1),[m
[31m-(9,'Новый компьютер',0,'',1,-1,1),[m
[31m-(10,'Новый компьютер',0,'',1,-1,1),[m
[31m-(11,'Новый компьютер',0,'',1,-1,1),[m
[31m-(12,'heelppp',0,'',1,1,1),[m
[31m-(13,'Новый компьютер',0,'',1,-1,1),[m
[31m-(14,'Новый компьютер',0,'',1,-1,1),[m
[31m-(15,'Новый компьютер',0,'',1,-1,1),[m
[31m-(16,'Новый компьютер',0,'',1,-1,1),[m
[31m-(17,'Новый компьютер',0,'',1,-1,1),[m
[31m-(18,'Новый компьютер',0,'',1,-1,1);[m
[31m-/*!40000 ALTER TABLE `computers` ENABLE KEYS */;[m
[31m-[m
[31m--- [m
[31m--- Definition of users[m
[31m--- [m
[31m-[m
[31m-DROP TABLE IF EXISTS `users`;[m
[31m-CREATE TABLE IF NOT EXISTS `users` ([m
[31m-  `id` int(32) NOT NULL AUTO_INCREMENT,[m
[31m-  `first_name` varchar(32) NOT NULL,[m
[31m-  `last_name` varchar(32) NOT NULL,[m
[31m-  `cab_id` int(32) NOT NULL,[m
[31m-  `type` int(32) NOT NULL,[m
[31m-  PRIMARY KEY (`id`),[m
[31m-  KEY `cab_id` (`cab_id`),[m
[31m-  KEY `type` (`type`),[m
[31m-  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`cab_id`) REFERENCES `rooms` (`id`),[m
[31m-  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`type`) REFERENCES `meta_user_type` (`id`)[m
[31m-) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;[m
[31m-[m
[31m--- [m
[31m--- Dumping data for table users[m
[31m--- [m
[31m-[m
[31m-/*!40000 ALTER TABLE `users` DISABLE KEYS */;[m
[31m-INSERT INTO `users`(`id`,`first_name`,`last_name`,`cab_id`,`type`) VALUES[m
[31m-(1,'Томас','Андерсон',1,-1),[m
[31m-(2,'Имя','Фамилия',1,1),[m
[31m-(3,'Имя','Фамилия',1,1);[m
[31m-/*!40000 ALTER TABLE `users` ENABLE KEYS */;[m
[31m-[m
[31m--- [m
[31m--- Dumping triggers[m
[31m--- [m
[31m-[m
[31m-DROP TRIGGER /*!50030 IF EXISTS */ `InsertComponentTrigger`;[m
[31m-DELIMITER |[m
[31m-CREATE TRIGGER `InsertComponentTrigger` BEFORE INSERT ON `components` FOR EACH ROW INSERT INTO journal Set info= CONCAT('inserted ' ,NEW.component_name, ' with ID = ', NEW.id) , log_type = 3, date_time=NOW() |[m
[31m-DELIMITER ;[m
[31m-[m
[31m-DROP TRIGGER /*!50030 IF EXISTS */ `UpdateComponentTrigger`;[m
[31m-DELIMITER |[m
[31m-CREATE TRIGGER `UpdateComponentTrigger` BEFORE UPDATE ON `components` FOR EACH ROW BEGIN[m
[31m-    IF NOT(OLD.component_name = NEW.component_name && OLD.computer_id = NEW.computer_id && OLD.status = NEW.status && OLD.serial_number = NEW.serial_number) THEN[m
[31m-        INSERT INTO journal Set info= CONCAT('updated from ' ,OLD.component_name, ' to ', NEW.component_name, ' with ID = ', NEW.id) , log_type = 3, date_time=NOW();[m
[31m-    END IF;[m
[31m-END |[m
[31m-DELIMITER ;[m
[31m-[m
[31m-DROP TRIGGER /*!50030 IF EXISTS */ `DeleteComponentTrigger`;[m
[31m-DELIMITER |[m
[31m-CREATE TRIGGER `DeleteComponentTrigger` BEFORE DELETE ON `components` FOR EACH ROW INSERT INTO journal Set info= CONCAT('deleted ' ,OLD.component_name, ' with ID = ', OLD.id) , log_type = 3, date_time=NOW() |[m
[31m-DELIMITER ;[m
[31m-[m
[31m-DROP TRIGGER /*!50030 IF EXISTS */ `InsertComputerTrigger`;[m
[31m-DELIMITER |[m
[31m-CREATE TRIGGER `InsertComputerTrigger` BEFORE INSERT ON `computers` FOR EACH ROW INSERT INTO journal Set info= CONCAT('inserted ' ,NEW.computer_name, ' with ID = ', NEW.id) , log_type = 2, date_time=NOW() |[m
[31m-DELIMITER ;[m
[31m-[m
[31m-DROP TRIGGER /*!50030 IF EXISTS */ `UpdateComputerTrigger`;[m
[31m-DELIMITER |[m
[31m-CREATE TRIGGER `UpdateComputerTrigger` BEFORE UPDATE ON `computers` FOR EACH ROW BEGIN[m
[31m-	IF NOT(OLD.computer_name = NEW.computer_name && OLD.price = NEW.price && OLD.serial_number = NEW.serial_number && OLD.`status` = NEW.`status` && OLD.room_id = NEW.room_id && OLD.`type` = NEW.`type`) THEN[m
[31m-		INSERT INTO journal Set info= CONCAT('updated computer from ' ,OLD.computer_name, ' to ', NEW.computer_name, ' with ID = ', NEW.id) , log_type = 2, date_time=NOW();[m
[31m-	END IF;[m
[31m-END |[m
[31m-DELIMITER ;[m
[31m-[m
[31m-DROP TRIGGER /*!50030 IF EXISTS */ `DeleteComputerTrigger`;[m
[31m-DELIMITER |[m
[31m-CREATE TRIGGER `DeleteComputerTrigger` BEFORE DELETE ON `computers` FOR EACH ROW BEGIN[m
[31m-UPDATE components set computer_id = NULL where components.computer_id = OLD.id;[m
[31m-INSERT INTO journal Set info= CONCAT('deleted ' ,OLD.computer_name, ' with ID = ', OLD.id) , log_type = 2, date_time=NOW();[m
[31m-END |[m
[31m-DELIMITER ;[m
[31m-[m
[31m-DROP TRIGGER /*!50030 IF EXISTS */ `InsertRoomTrigger`;[m
[31m-DELIMITER |[m
[31m-CREATE TRIGGER `InsertRoomTrigger` BEFORE INSERT ON `rooms` FOR EACH ROW INSERT INTO journal Set info= CONCAT('inserted ' ,NEW.room_name, ' with ID = ', NEW.id) , log_type = 4, date_time=NOW() |[m
[31m-DELIMITER ;[m
[31m-[m
[31m-DROP TRIGGER /*!50030 IF EXISTS */ `UpdateRoomTrigger`;[m
[31m-DELIMITER |[m
[31m-CREATE TRIGGER `UpdateRoomTrigger` BEFORE UPDATE ON `rooms` FOR EACH ROW BEGIN[m
[31m-    IF NOT(OLD.room_name = NEW.room_name) THEN[m
[31m-        INSERT INTO journal Set info= CONCAT('updated from ' ,OLD.room_name,' to ', NEW.room_name, ' with ID = ', NEW.id) , log_type = 4, date_time=NOW();[m
[31m-    END IF;[m
[31m-END |[m
[31m-DELIMITER ;[m
[31m-[m
[31m-DROP TRIGGER /*!50030 IF EXISTS */ `DeleteRoomTrigger`;[m
[31m-DELIMITER |[m
[31m-CREATE TRIGGER `DeleteRoomTrigger` BEFORE DELETE ON `rooms` FOR EACH ROW INSERT INTO journal Set info= CONCAT('deleted ' ,OLD.room_name, ' with ID = ', OLD.id) , log_type = 4, date_time=NOW() |[m
[31m-DELIMITER ;[m
[31m-[m
[31m-DROP TRIGGER /*!50030 IF EXISTS */ `InsertUserTrigger`;[m
[31m-DELIMITER |[m
[31m-CREATE TRIGGER `InsertUserTrigger` BEFORE INSERT ON `users` FOR EACH ROW INSERT INTO journal Set info= CONCAT('inserted ' ,NEW.first_name, ' ', NEW.last_name, ' with ID = ', NEW.id) , log_type = 1, date_time=NOW() |[m
[31m-DELIMITER ;[m
[31m-[m
[31m-DROP TRIGGER /*!50030 IF EXISTS */ `UpdateUserTrigger`;[m
[31m-DELIMITER |[m
[31m-CREATE TRIGGER `UpdateUserTrigger` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN[m
[31m-    IF NOT(OLD.first_name = NEW.first_name && OLD.last_name = NEW.last_name && OLD.cab_id = NEW.cab_id && OLD.type = NEW.type) THEN[m
[31m-        INSERT INTO journal Set info= CONCAT('updated from ' ,OLD.first_name, ' ', OLD.last_name, ' to ', NEW.first_name, ' ', NEW.last_name,' with ID = ', NEW.id) , log_type = 1, date_time=NOW();[m
[31m-    END IF;[m
[31m-END |[m
[31m-DELIMITER ;[m
[31m-[m
[31m-DROP TRIGGER /*!50030 IF EXISTS */ `DeleteUserTrigger`;[m
[31m-DELIMITER |[m
[31m-CREATE TRIGGER `DeleteUserTrigger` BEFORE DELETE ON `users` FOR EACH ROW INSERT INTO journal Set info= CONCAT('deleted ' ,OLD.first_name, ' ', OLD.last_name,' with ID = ', OLD.id) , log_type = 1, date_time=NOW() |[m
[31m-DELIMITER ;[m
[31m-[m
[31m-[m
[31m-/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;[m
[31m-/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;[m
[31m-/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;[m
[31m-/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;[m
[31m-/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;[m
[31m-/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;[m
[31m-/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;[m
[31m-[m
[31m-[m
[31m--- Dump completed on 2019-11-05 15:24:20[m
[31m--- Total time: 0:0:0:0:613 (d:h:m:s:ms)[m
