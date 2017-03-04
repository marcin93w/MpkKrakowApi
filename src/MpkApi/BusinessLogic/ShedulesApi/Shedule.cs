using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MpkApi.BusinessLogic.ShedulesApi
{
    public class Shedule
    {
        public string LineName { get; set; }
        public string StopName { get; set; }
        public string Destination { get; set; }
        public IEnumerable<DateTime> Departures { get; set; }
    }
}
