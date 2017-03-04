using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MpkApi.BusinessLogic;
using MpkApi.BusinessLogic.StopsDatabase;

namespace MpkApi.Controllers
{
    [Route("api/[controller]")]
    public class ValuesController : Controller
    {
        private readonly PointsResolver _pointsResolver;
        private readonly StopsFinder _stopsFinder;

        public ValuesController(PointsResolver pointsResolver, StopsFinder stopsFinder)
        {
            _pointsResolver = pointsResolver;
            _stopsFinder = stopsFinder;
        }

        // GET api/values
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return
                _stopsFinder.FindNearestStopGroupIds(20.1, 50.1, 10)
                    .Select(stop => $"{stop.Name}, meters: {stop.Distance}");
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return $"value: {string.Join(", ", _pointsResolver.GetPointsForStopGroupId(id))}";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
