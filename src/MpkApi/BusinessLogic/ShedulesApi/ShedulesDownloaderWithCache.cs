using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace MpkApi.BusinessLogic.ShedulesApi
{
    public class ShedulesDownloaderWithCache : IShedulesDownloader
    {
        private readonly IShedulesDownloader _shedulesDownloader;
        private readonly Dictionary<Tuple<int, string>, Shedule> _responsesCache;

        public ShedulesDownloaderWithCache(IShedulesDownloader shedulesDownloader)
        {
            _shedulesDownloader = shedulesDownloader;
            _responsesCache = new Dictionary<Tuple<int, string>, Shedule>();
        }

        public async Task<Shedule> DownloadShedule(int pointId, string lineName)
        {
            var input = new Tuple<int, string>(pointId, lineName);
            if (!_responsesCache.ContainsKey(input))
            {
                var response = await _shedulesDownloader.DownloadShedule(pointId, lineName);
                _responsesCache.Add(input, response);
            }

            return _responsesCache[input];
        }
    }
}
