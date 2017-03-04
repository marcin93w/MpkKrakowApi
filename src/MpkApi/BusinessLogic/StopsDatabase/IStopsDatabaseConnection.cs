using System.Collections.Generic;

namespace MpkApi.BusinessLogic.StopsDatabase
{
    public interface IStopsDatabaseConnection
    {
        IEnumerable<dynamic> ExecuteQuery(string query, object param);
        IEnumerable<T> ExecuteQuery<T>(string query, object param);
    }
}