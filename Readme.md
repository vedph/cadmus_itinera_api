# Cadmus Itinera API

Quick Docker image build: `docker build . -t vedph2020/cadmus_itinera_api:1.0.6 -t vedph2020/cadmus_itinera_api:latest` (replace with the current version).

This is a Cadmus API layer customized for the Itinera project. Most of its code is derived from shared Cadmus libraries.

## Project Creation Procedure

1. create a new ASP.NET Core web API project.

2. add packages:

- `AspNetCore.Identity.Mongo`
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
- `Swashbuckle.AspNetCore.Swagger`
- `Swashbuckle.AspNetCore.SwaggerGen`
- `Swashbuckle.AspNetCore.SwaggerUi`
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
