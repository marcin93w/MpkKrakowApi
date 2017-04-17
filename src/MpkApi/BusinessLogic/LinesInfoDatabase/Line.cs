namespace MpkApi.BusinessLogic.LinesInfoDatabase
{
    public class Line
    {
        public Line(string name, string destination)
        {
            Name = name;
            Destination = destination;
        }

        public string Name { get; }
        public string Destination { get; }
    }
}