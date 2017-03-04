using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MpkApi.BusinessLogic.ShedulesApi;
using Newtonsoft.Json.Linq;
using Xunit;

namespace MpkApi.Test
{
    public class SchedulesDownloaderCacheTests
    {
        private readonly MpkApiClientStub _mpkApiClientStub = new MpkApiClientStub();

        [Fact]
        public async void ShouldReturnCachedResponseForSecondRequest()
        {
            var mpkApiClientWithCache = new ShedulesDownloaderWithCache(new ShedulesDownloader(_mpkApiClientStub));
            int point = 1;
            var line = "asd";

            await mpkApiClientWithCache.DownloadShedule(point, line);
            await mpkApiClientWithCache.DownloadShedule(point, line);

            Assert.Equal(1, _mpkApiClientStub.RequestsCount);
        }

        [Fact]
        public async void ShouldReturnNewResponseForDifferentRequest()
        {
            var mpkApiClientWithCache = new ShedulesDownloaderWithCache(new ShedulesDownloader(_mpkApiClientStub));

            await mpkApiClientWithCache.DownloadShedule(1, "asd");
            await mpkApiClientWithCache.DownloadShedule(1, "as");

            Assert.Equal(2, _mpkApiClientStub.RequestsCount);
        }
    }
}
