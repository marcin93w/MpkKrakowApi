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

        public IEnumerable<Line> FindLineNamesForPoint(int pointId)
        {
            var query = $@"
                SELECT DISTINCT LineName, LastStopName
                FROM Routes r
                JOIN Variants v on (r.VariantId = v.Id)
                WHERE r.PointId = {pointId} AND ""default"" = 1";

            var results = _database.ExecuteSelectQuery(query);
            return results.Select(row => new Line((string)row[0], (string)row[1]));
        }
    }
}
