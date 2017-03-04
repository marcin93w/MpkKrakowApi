using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace MpkApi.BusinessLogic.StopsDatabase
{
    public class StopsFinder
    {
        private readonly IStopsDatabaseConnection _database;

        public StopsFinder(IStopsDatabaseConnection database)
        {
            _database = database;
        }

        public IEnumerable<StopFindResult> FindNearestStopGroupIds(double lon, double lat, int limit)
        {
            var query = @"SELECT 
	            s.stop_group_id as StopGroupId,
                sg.name as Name, 
                AVG(ST_Distance(ST_MakePoint(location[0], location[1])::geography, ST_PointFromText(@Point)::geography)) as Distance 
                FROM public.stops s
                JOIN public.stop_groups sg ON (s.stop_group_id = sg.id)
                GROUP BY s.stop_group_id, sg.name
 	            ORDER BY Distance
                LIMIT @Limit;";

            return _database.ExecuteQuery<StopFindResult>(query, 
                new { Point = $"POINT({GetStringWithDotSeparator(lon)} {GetStringWithDotSeparator(lat)})", Limit = limit });
        }

        private string GetStringWithDotSeparator(double d)
        {
            return d.ToString(NumberFormatInfo.InvariantInfo);
        }
    }
}
