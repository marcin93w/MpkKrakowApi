using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace MpkApi.BusinessLogic
{
    public interface IMpkApiClient
    {
        Task<string> GetPointData(JObject jsonObject);
    }
}