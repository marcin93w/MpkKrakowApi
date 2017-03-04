using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace MpkApi.BusinessLogic.ShedulesApi
{
    public interface IMpkApiClient
    {
        Task<string> GetPointData(JObject jsonObject);
    }
}