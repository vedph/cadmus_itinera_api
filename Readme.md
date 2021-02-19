# Cadmus Itinera API

Quick Docker image build: `docker build . -t vedph2020/cadmus_itinera_api:1.0.24 -t vedph2020/cadmus_itinera_api:latest` (replace with the current version).

Note: as per current [NuGet issues](https://github.com/NuGet/Home/issues/10491), I temporarily changed the Docker image from `mcr.microsoft.com/dotnet/sdk:5.0-buster-slim AS build` to `mcr.microsoft.com/dotnet/sdk:5.0.102-ca-patch-buster-slim AS build`. I will revert as soon as the MS issue is resolved (see [status](https://status.nuget.org/)).

This is a Cadmus API layer customized for the Itinera project. Most of its code is derived from shared Cadmus libraries.

## Project Creation Procedure

1. create a new ASP.NET Core web API project.

2. add packages:

- `AspNetCore.Identity.Mongo`
- `Cadmus.Api.Controllers`
- `Cadmus.Api.Models`
- `Cadmus.Api.Services`
- `Microsoft.AspNetCore.Authentication.JwtBearer`
- `Microsoft.AspNetCore.Mvc.NewtonsoftJson`
- `Polly`
- `Serilog`
- `Serilog.AspNetCore`
- `Serilog.Exceptions`
- `Serilog.Extensions.Hosting`
- `Serilog.Sinks.Console`
- `Serilog.Sinks.File`
- `Serilog.Sinks.MongoDB`
- `Swashbuckle.AspNetCore`
- `Cadmus.Itinera.Models`
- `Cadmus.Itinera.Services`
- `Cadmus.Itinera.Controllers`

3. copy `Program.cs` from CadmusApi, adjusting the namespace and text messages as desired.

4. copy `Startup.cs` from CadmusApi, adjusting the namespace.

5. copy settings from `appsettings.json` in CadmusApi, adjusting application title and other app-dependent text as desired. Also, be sure to change:

- the database names (`DatabaseNames`;
- the Serilog connection string (`Serilog:ConnectionString`).

6. copy `Dockerfile` and `docker-compose.yml` from CadmusApi and adjust them for this project:

- in `Dockerfile`, change the project's name.
- in `docker-compose.yml`, change the `cadmus-api` image name, and its port (to reflect this project's port).

7. in the project's properties, ensure that the port is not conflicting with other port numbers in your environment (you can also see <https://stackoverflow.com/questions/37365277/how-to-specify-the-port-an-asp-net-core-application-is-hosted-on>).

8. copy `wwwroot` from CadmusApi, and customize its contents (the Cadmus profile, and if needed the messages template text).
