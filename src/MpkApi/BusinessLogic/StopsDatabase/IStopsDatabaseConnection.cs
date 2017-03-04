namespace MpkApi.BusinessLogic.StopsDatabase
{
    public interface IStopsDatabaseConnection
    {
        System.Collections.Generic.IEnumerable<dynamic> ExecuteQuery(string query, object param);
    }
}