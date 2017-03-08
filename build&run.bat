cd database
docker build -t mpkkrakowapidatabase .
docker run --name mkapostgis -e POSTGRES_PASSWORD=postgres -d mpkkrakowapidatabase

cd ..\src\MpkApi

dotnet restore
dotnet publish -c Release -o out
docker build -t mpkkrakowapi .
docker run --link mkapostgis:postgres -d -p 80:80 mpkkrakowapi