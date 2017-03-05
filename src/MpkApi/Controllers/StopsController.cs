using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MpkApi.BusinessLogic.StopsDatabase;

namespace MpkApi.Controllers
{
    [Route("api/[controller]")]
    public class StopsController : Controller
    {
        private readonly StopsFinder _stopsFinder;

        public StopsController(StopsFinder stopsFinder)
        {
            _stopsFinder = stopsFinder;
        }

        [HttpGet]
        public IEnumerable<StopFindResult> Get([FromQuery]double lon, [FromQuery]double lat)
        {
            return _stopsFinder.FindNearestStops(lon, lat, 10);
        }
    }
}
