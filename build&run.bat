cd database
docker build -t mpkkrakowapidatabase .
docker run --name mkapostgis -e POSTGRES_PASSWORD=supersecretpassword -d mpkkrakowapidatabase

cd ..\src\MpkApi

dotnet restore
dotnet publish -c Release -o out
docker build -t mpkkrakowapi .
docker run --link mkapostgis:postgres -e DBInfo__ConnectionString="User ID=postgres;Password=supersecretpassword;Host=postgres;Port=5432;Database=postgres;Pooling=true;" -d -p 80:80 mpkkrakowapi

cd ../..