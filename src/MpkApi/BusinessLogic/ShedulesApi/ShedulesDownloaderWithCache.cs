using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json.Linq;

namespace MpkApi.BusinessLogic.ShedulesApi
{
    public class ShedulesDownloaderWithCache : IShedulesDownloader
    {
        private readonly IShedulesDownloader _shedulesDownloader;
        private readonly ILogger<ShedulesDownloader> _log;
        private readonly Dictionary<Tuple<int, string, DateTime>, Shedule> _responsesCache;

        public ShedulesDownloaderWithCache(IShedulesDownloader shedulesDownloader, ILogger<ShedulesDownloader> log)
        {
            _shedulesDownloader = shedulesDownloader;
            this._log = log;
            _responsesCache = new Dictionary<Tuple<int, string, DateTime>, Shedule>();
        }

        public async Task<Shedule> DownloadShedule(int pointId, string lineName)
        {
            var input = new Tuple<int, string, DateTime>(pointId, lineName, DateTime.Today);
            if (!_responsesCache.ContainsKey(input))
            {
                var response = await _shedulesDownloader.DownloadShedule(pointId, lineName);

                _log.LogInformation($"Shedule for line {lineName} from point {pointId} downloaded from external API.");

                _responsesCache.Add(input, response);
            }
            else
            {
                _log.LogInformation($"Shedule for line {lineName} from point {pointId} loaded from cache.");
            }

            return _responsesCache[input];
        }
    }
}
