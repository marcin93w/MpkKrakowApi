using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MpkApi.BusinessLogic;

namespace MpkApi.Controllers
{
    [Route("api/[controller]")]
    public class DeparturesController : Controller
    {
        private readonly DeparturesManager _departuresManager;

        public DeparturesController(DeparturesManager departuresManager)
        {
            _departuresManager = departuresManager;
        }

        [HttpGet("{stopGroupId}")]
        public async Task<IEnumerable<Departure>> Get(int stopGroupId)
        {
            return await _departuresManager.GetDeparturesFormStopGroup(stopGroupId);
        }
    }
}
