# Stage 1: base
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Stage 2: build
FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["CadmusItineraApi/CadmusItineraApi.csproj", "CadmusItineraApi/"]
# copy local packages to avoid using a NuGet custom feed, then restore
COPY ./local-packages /src/local-packages
RUN dotnet restore "CadmusItineraApi/CadmusItineraApi.csproj" -s /src/local-packages -s https://api.nuget.org/v3/index.json --verbosity n
# copy the content of the API project
COPY . .
# build it
RUN dotnet build "CadmusItineraApi/CadmusItineraApi.csproj" -c Release -o /app/build

# Stage 3: publish
FROM build AS publish
RUN dotnet publish "CadmusItineraApi/CadmusItineraApi.csproj" -c Release -o /app/publish

# Stage 4: final
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CadmusItineraApi.dll"]