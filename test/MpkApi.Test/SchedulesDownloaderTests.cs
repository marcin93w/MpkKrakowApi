using System;
using System.Collections.Generic;
using System.Linq;
using Moq;
using MpkApi.BusinessLogic.ShedulesApi;
using Newtonsoft.Json.Linq;
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

        [Fact]
        public async void ShouldIgnoreAdditionalInfoAtDepartureTime()
        {
            var testData = @"{""d"":{""__type"":""Ideo.BusinessLogic.PointData"",""LineName"":""163"",""StopName"":""Rżąka"",""Route"":""Rżąka - Czerwiakowskiego, Wielicka, Teligi, Ćwiklińskiej, Bieżanowska, Agatowa, Półłanki, Klasztorna, Al. Jana Pawła II, Al. Solidarności, Al. Przyjaźni - Aleja Przyjaźni"",""Description"":""K - Kurs do przystanku Kombinat\n"",""ValidFrom"":""25.02.2017"",""PointTime"":{""03"":{""5"":[""06K"",""36""],""6"":[""36""],""7"":[""36""],""8"":[""19"",""59""],""9"":[""39""],""10"":[""19"",""59""],""11"":[""39""],""12"":[""19"",""59""],""13"":[""39""],""14"":[""19"",""59""],""15"":[""39""],""16"":[""19"",""59""],""17"":[""39""],""18"":[""19"",""59""],""19"":[""55""],""20"":[""49""],""21"":[""49""],""22"":[""49""]}}}}";

            var apiClientMock = new Mock<IMpkApiClient>();
            apiClientMock.Setup(client => client.GetPointData(It.IsAny<JObject>())).Returns(async () => testData);
            var shedulesDownloader = new ShedulesDownloader(apiClientMock.Object);

            var shedules = await shedulesDownloader.DownloadShedule(2, "asd");

            Assert.Equal(DateTime.Today.AddHours(5).AddMinutes(6), shedules.Departures.First());
        }
    }
}
