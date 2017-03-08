FROM microsoft/dotnet:1.0-runtime
ENV ASPNETCORE_URLS http://+:80
WORKDIR /app
COPY out .
ENTRYPOINT ["dotnet", "MpkApi.dll"]