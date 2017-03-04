using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace MpkApi.BusinessLogic.StopsDatabase
{
    public class PointsResolver
    {
        private readonly IStopsDatabaseConnection _database;

        public PointsResolver(IStopsDatabaseConnection database)
        {
            _database = database;
        }
        
        public IEnumerable<int> GetPointsForStopGroupId(int stopGroupId)
        {
            var results = _database.ExecuteQuery(
                "SELECT id FROM public.points WHERE points.stop_group_id=@StopGroupId",
                new {StopGroupId = stopGroupId});

            return results.Select(row => (int)row.id);   
        }
    }
}
