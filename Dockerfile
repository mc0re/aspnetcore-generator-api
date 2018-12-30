FROM microsoft/dotnet:2.2-sdk AS build-env
WORKDIR /generator
COPY api/api.csproj api/
RUN dotnet restore api
COPY tests/tests.csproj tests/
RUN dotnet restore tests

COPY . .
# Turn on XUnit integration with TeamCity
ENV TEAMCITY_PROJECT_NAME="Aspnetcore Generator Api"
RUN dotnet test tests

RUN dotnet publish api -o /publish

FROM microsoft/dotnet:2.2-aspnetcore-runtime
COPY --from=build-env /publish /publish
WORKDIR /publish
ENTRYPOINT [ "dotnet", "api.dll" ]
