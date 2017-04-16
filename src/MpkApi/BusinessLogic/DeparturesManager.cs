using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using MpkApi.BusinessLogic.LinesInfoDatabase;
using MpkApi.BusinessLogic.ShedulesApi;
using MpkApi.BusinessLogic.StopsDatabase;

namespace MpkApi.BusinessLogic
{
    public class DeparturesManager
    {
        private readonly PointsResolver _pointsResolver;
        private readonly LinesFinder _linesFinder;
        private readonly IShedulesDownloader _shedulesDownloader;
        private readonly ILogger<DeparturesManager> _log;

        public DeparturesManager(PointsResolver pointsResolver, LinesFinder linesFinder, IShedulesDownloader shedulesDownloader,
            ILogger<DeparturesManager> log)
        {
            _pointsResolver = pointsResolver;
            _linesFinder = linesFinder;
            _shedulesDownloader = shedulesDownloader;
            _log = log;
        }

        public async Task<IEnumerable<Departure>> GetDeparturesFormStopGroup(int stopGroupId)
        {
            _log.LogInformation($"Finding departures from stop group id: {stopGroupId}.");

            var departures = new List<Departure>();

            var points = _pointsResolver.GetPointsForStopGroupId(stopGroupId);
            foreach (var point in points)
            {
                var lines = _linesFinder.FindLineNamesForPoint(point);
                foreach (var line in lines)
                {
                    var shedule = await _shedulesDownloader.DownloadShedule(point, line);

                    _log.LogInformation($"Found {shedule.Departures.Count()} departures of line {line} from point {point}.");

                    departures.AddRange(
                        shedule.Departures.Select(d => new Departure(shedule.LineName, shedule.Destination, d)));
                }
            }

            return departures;
        }
    }
}
