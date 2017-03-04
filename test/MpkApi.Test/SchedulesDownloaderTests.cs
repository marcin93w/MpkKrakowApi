using System;
using System.Collections.Generic;
using System.Linq;
using MpkApi.BusinessLogic.ShedulesApi;
using Xunit;

namespace MpkApi.Test
{
    public class SchedulesDownloaderTests
    {
        private readonly ShedulesDownloader _shedulesDownloader;

        public SchedulesDownloaderTests()
        {
            _shedulesDownloader = new ShedulesDownloader(new MpkApiClientStub());
        }

        [Fact]
        public async void ShouldReturnProperLineNumber()
        {
            var lineName = "144";

            var shedule = await _shedulesDownloader.DownloadShedule(10336, lineName);

            Assert.Equal(lineName, shedule.LineName);
        }

        [Fact]
        public async void ShouldReturnProperDestination()
        {
            var shedule = await _shedulesDownloader.DownloadShedule(10336, "144");

            Assert.Equal("Prądnik Biały", shedule.Destination);
        }

        [Fact]
        public async void ShouldReturnProperStopName()
        {
            var shedule = await _shedulesDownloader.DownloadShedule(10336, "144");

            Assert.Equal("AGH", shedule.StopName);
        }

        [Fact]
        public async void ShouldReturnProperDepartureTimes()
        {
            var lastThreeDepartures = new[]
            {
                DateTime.Today.AddHours(23).AddMinutes(3),
                DateTime.Today.AddHours(22).AddMinutes(38),
                DateTime.Today.AddHours(22).AddMinutes(14)
            };

            var shedule = await _shedulesDownloader.DownloadShedule(10336, "144");

            Assert.True(shedule.Departures.Reverse().Take(3).SequenceEqual(lastThreeDepartures));
        }
    }
}
