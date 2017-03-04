using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Microsoft.Extensions.Configuration;
using Npgsql;

namespace MpkApi.BusinessLogic.StopsDatabase
{
    public class StopsDatabaseConnection : IStopsDatabaseConnection
    {
        private readonly string _connectionString;
        public StopsDatabaseConnection(IConfiguration configuration)
        {
            _connectionString = configuration.GetValue<string>("DBInfo:ConnectionString");
        }

        private IDbConnection Connection => new NpgsqlConnection(_connectionString);

        public IEnumerable<dynamic> ExecuteQuery(string query, object param)
        {
            return ExecuteQuery<dynamic>(query, param);
        }

        public IEnumerable<T> ExecuteQuery<T>(string query, object param)
        {
            using (var dbConnection = Connection)
            {
                dbConnection.Open();
                return dbConnection.Query<T>(query, param);
            }
        }
    }
}
