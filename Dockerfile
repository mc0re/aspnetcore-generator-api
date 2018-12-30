FROM microsoft/dotnet:2.2-sdk AS build-env

# xUnit -> TeamCity integration: variable and verbosity (in RUN)
ARG TEAMCITY_PROJECT_NAME=fake
ENV TEAMCITY_PROJECT_NAME $TEAMCITY_PROJECT_NAME

WORKDIR /generator
COPY api/api.csproj api/
RUN dotnet restore api
COPY tests/tests.csproj tests/
RUN dotnet restore tests

COPY . .
RUN dotnet test --verbosity=normal tests

RUN dotnet publish api -o /publish

FROM microsoft/dotnet:2.2-aspnetcore-runtime
COPY --from=build-env /publish /publish
WORKDIR /publish
ENTRYPOINT [ "dotnet", "api.dll" ]
