using System.Threading.Tasks;

namespace MpkApi.BusinessLogic.ShedulesApi
{
    public interface IShedulesDownloader
    {
        Task<Shedule> DownloadShedule(int pointId, string lineName);
    }
}