using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MpkApi.BusinessLogic.StopsDatabase
{
    public class StopFindResult
    {
        public int StopGroupId { set; get; }
        public string Name { set; get; }
        public double Distance { set; get; }
    }
}
