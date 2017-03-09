FROM microsoft/dotnet:1.0-runtime
ENV ASPNETCORE_URLS http://+:80
WORKDIR /app
COPY out .
COPY Resources .
ENTRYPOINT ["dotnet", "MpkApi.dll"]