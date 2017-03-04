using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MpkApi.BusinessLogic.ShedulesApi;
using Newtonsoft.Json.Linq;

namespace MpkApi.Test
{
    public class MpkApiClientStub : IMpkApiClient
    {
        public async Task<string> GetPointData(JObject jsonObject)
        {
            return @"{
              ""d"": {
                ""__type"": ""Ideo.BusinessLogic.PointData"",
                ""LineName"": ""144"",
                ""StopName"": ""AGH"",
                ""Route"": ""Rżąka - Czerwiakowskiego, Wielicka, Kamieńskiego, Konopnickiej, Al. Krasińskiego, Al. Mickiewicza, Czarnowiejska, Al. Kijowska, Wrocławska, Stachiewicza, Makowskiego, Batalionu \""Skała\"" AK, Wyki, Pachońskiego - Prądnik Biały"",
                ""Description"": null,
                ""ValidFrom"": ""01.10.2016"",
                ""PointTime"": {
                  ""04"": {
                    ""4"": [
                      ""57""
                    ],
                    ""5"": [
                      ""29"",
                      ""53""
                    ],
                    ""6"": [
                      ""19"",
                      ""43"",
                      ""55""
                    ],
                    ""7"": [
                      ""09"",
                      ""23"",
                      ""35"",
                      ""47"",
                      ""59""
                    ],
                    ""8"": [
                      ""11"",
                      ""23"",
                      ""35"",
                      ""47""
                    ],
                    ""9"": [
                      ""01"",
                      ""24"",
                      ""48""
                    ],
                    ""10"": [
                      ""10"",
                      ""34"",
                      ""58""
                    ],
                    ""11"": [
                      ""22"",
                      ""46""
                    ],
                    ""12"": [
                      ""10"",
                      ""34"",
                      ""58""
                    ],
                    ""13"": [
                      ""25"",
                      ""48""
                    ],
                    ""14"": [
                      ""13"",
                      ""37"",
                      ""49""
                    ],
                    ""15"": [
                      ""01"",
                      ""13"",
                      ""25"",
                      ""37"",
                      ""49""
                    ],
                    ""16"": [
                      ""01"",
                      ""13"",
                      ""25"",
                      ""37"",
                      ""49""
                    ],
                    ""17"": [
                      ""01"",
                      ""13"",
                      ""25"",
                      ""37"",
                      ""49""
                    ],
                    ""18"": [
                      ""01"",
                      ""13"",
                      ""25"",
                      ""37"",
                      ""49""
                    ],
                    ""19"": [
                      ""01"",
                      ""14"",
                      ""26"",
                      ""38"",
                      ""50""
                    ],
                    ""20"": [
                      ""02"",
                      ""14"",
                      ""26"",
                      ""39""
                    ],
                    ""21"": [
                      ""03"",
                      ""26"",
                      ""50""
                    ],
                    ""22"": [
                      ""14"",
                      ""38""
                    ],
                    ""23"": [
                      ""03""
                    ]
                  }
                }
              }
            }";
        }
    }
}
