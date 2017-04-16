using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace MpkApi.BusinessLogic.ShedulesApi
{
    public class ShedulesDownloader : IShedulesDownloader
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
            var pointTime = Equals(json["PointTime"], JValue.CreateNull()) ? null : json["PointTime"].First.First;

            return new Shedule
            {
                StopName = stopName,
                LineName = lineName,
                Destination = route == null ? null : GetLastStop(route),
                Departures = pointTime == null ? Enumerable.Empty<DateTime>() : GetDepartures(pointTime)
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
                var hour = GetLeadingInt(hourProperty.Name);

                foreach (var minuteValue in (JArray)hourProperty.Value)
                {
                    var minute = GetLeadingInt(minuteValue.Value<string>());

                    yield return DateTime.Today.AddHours(hour).AddMinutes(minute);
                }
            }
        }

        private int GetLeadingInt(string input)
        {
            return int.Parse(new string(input.Trim().TakeWhile(c => char.IsDigit(c) || c == '.').ToArray()));
        }
    }
}
