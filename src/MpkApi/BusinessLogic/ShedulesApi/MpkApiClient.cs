using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace MpkApi.BusinessLogic.ShedulesApi
{
    public class MpkApiClient : IMpkApiClient
    {
        private string _uri = "http://m.rozklady.mpk.krakow.pl/Services/data.asmx/GetPointData";

        public async Task<string> GetPointData(JObject jsonObject)
        {
            var httpClient = new HttpClient();
            var content = new StringContent(jsonObject.ToString(), Encoding.UTF8, "application/json");
            var response = await httpClient.PostAsync(_uri, content);

            response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsStringAsync();
        }
    }
}
