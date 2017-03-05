using System;

namespace MpkApi.BusinessLogic
{
    public class Departure
    {
        public Departure(string lineName, string destination, DateTime departureTime)
        {
            LineName = lineName;
            Destination = destination;
            DepartureTime = departureTime;
        }

        public string LineName { get; }
        public string Destination { get; }
        public DateTime DepartureTime { get; }
    }
}