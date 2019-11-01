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
        public List<JournalEvent> JournalEvents { get; set; }
        public CustomModelCommand<JournalEvent> FilterJournal { get; set; }
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
        }
    }
}
