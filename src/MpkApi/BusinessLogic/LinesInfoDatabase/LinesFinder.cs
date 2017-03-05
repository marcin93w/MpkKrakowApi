using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MpkApi.BusinessLogic.LinesInfoDatabase
{
    public class LinesFinder
    {
        private readonly LinesInfoDatabaseConnection _database;

        public LinesFinder(LinesInfoDatabaseConnection database)
        {
            _database = database;
        }

        public IEnumerable<string> FindLineNamesForPoint(int pointId)
        {
            var query = $@"
                SELECT DISTINCT LineName
                FROM Routes r
                JOIN Variants v on (r.VariantId = v.Id)
                WHERE r.PointId = {pointId}";

            var results = _database.ExecuteSelectQuery(query);
            return results.Select(row => (string)row[0]);
        }
    }
}
