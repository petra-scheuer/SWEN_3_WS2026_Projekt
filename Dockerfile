FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
# Legt /src als Arbeitsverzeichnis innerhalb des Containers fest.
WORKDIR /src
# Kopiert die zentralen Build-Konfigurationen in den Container.
COPY Directory.Build.props global.json ./
COPY src/ src/
# Baut und veröffentlicht die API im Release-Modus.
# Die fertigen Dateien werden im Ordner /app abgelegt.
RUN dotnet publish src/Paperless.Api/Paperless.Api.csproj -c Release -o /app

#sdk wird nicht mehr gebraucht
FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
COPY --from=build /app .
EXPOSE 8080
ENTRYPOINT ["dotnet", "Paperless.Api.dll"]
