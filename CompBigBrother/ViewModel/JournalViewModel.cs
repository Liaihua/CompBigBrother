using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CompBigBrother.Model;
using CompBigBrother.DatabaseAccessLayer;
namespace CompBigBrother.ViewModel
{
    public class JournalViewModel : AbstractNotifyModel
    {
        JournalSql journal = new JournalSql();

        public string SelectedCondition { get; set; }
        public List<string> SearchConditions { get; set; } = new List<string>(new string[] {"Дата", "По объектам"});
        public List<JournalEvent> FilteredJournalEvents { get; set; }
        public List<JournalEvent> JournalEvents { get; set; }
        public CustomModelCommand<string> FilterJournal { get; set; }
        public CustomModelCommand<JournalEvent> RefreshJournal { get; set; }

        public JournalViewModel()
        {
            JournalEvents = journal.GetJournal();
            LogObject.GetAllLogObjects();
            RefreshJournal = new CustomModelCommand<JournalEvent>((c) =>
            {
                JournalEvents = journal.GetJournal();
                RaiseEvent(nameof(JournalEvents));
            });

            FilterJournal = new CustomModelCommand<string>((s) => 
            {
                if(SelectedCondition != null)
                {
                    switch (SelectedCondition)
                    {
                        case "Дата":
                            DateTime inputDateTime = new DateTime();
                            if (DateTime.TryParse(s, out inputDateTime))
                                FilteredJournalEvents = JournalEvents.Where((e) => e.DateTime.Date == inputDateTime.Date).ToList();
                            break;
                        case "По объектам":
                            FilteredJournalEvents = JournalEvents.Where((e) => e.Info.Contains(s)).ToList();
                            break;
                    }
                }
            });
        }
    }
}
