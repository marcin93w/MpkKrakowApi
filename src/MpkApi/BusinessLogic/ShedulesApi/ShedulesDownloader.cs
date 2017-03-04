using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace MpkApi.BusinessLogic.ShedulesApi
{
    public class ShedulesDownloader
    {
        private readonly IMpkApiClient _apiClient;

        public ShedulesDownloader(IMpkApiClient apiClient)
        {
            _apiClient = apiClient;
        }

        public async Task<Shedule> DownloadShedule(int pointId, string lineName)
        {
            var jsonObject = new JObject
            {
                ["variantId"] = 0,
                ["pointId"] = pointId,
                ["lineName"] = lineName
            };
            var data = await _apiClient.GetPointData(jsonObject);
            var json = JObject.Parse(data)["d"];

            var stopName = json.Value<string>("StopName");
            var route = json.Value<string>("Route");
            var pointTime = json["PointTime"].First.First;

            return new Shedule
            {
                StopName = stopName,
                LineName = lineName,
                Destination = GetLastStop(route),
                Departures = GetDepartures(pointTime)
            };
        }

        private string GetLastStop(string route)
        {
            return route.Split('-').Last().TrimStart(' ');
        }

        private IEnumerable<DateTime> GetDepartures(JToken pointTime)
        {
            foreach (var child in pointTime.Children())
            {
                var hourProperty = (JProperty) child;
                var hour = int.Parse(hourProperty.Name);

                foreach (var minuteValue in (JArray)hourProperty.Value)
                {
                    var minute = int.Parse(minuteValue.Value<string>());

                    yield return DateTime.Today.AddHours(hour).AddMinutes(minute);
                }
            }
        }
    }
}
