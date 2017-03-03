using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.Sqlite;

namespace MpkApi.BusinessLogic
{
    public class RoutesInfoDatabase
    {
        private readonly SqliteConnectionStringBuilder _connectionString;

        public RoutesInfoDatabase()
        {
            _connectionString = new SqliteConnectionStringBuilder
            {
                DataSource = @"rozklady-2016-12-23-13-03.zip"
            };
        }

        public IEnumerable<IList<object>> ExecuteSelectQuery(string query)
        {
            using (var connection = new SqliteConnection(_connectionString.ToString()))
            {
                connection.Open();
                var selectCommand = connection.CreateCommand();
                selectCommand.CommandText = query;
                using (var reader = selectCommand.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        object[] values = new object[reader.FieldCount];
                        reader.GetValues(values);

                        yield return values;
                    }
                }
            }
        }

    }
}
