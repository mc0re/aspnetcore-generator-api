FROM microsoft/dotnet:2.2-sdk

ENV TEAMCITY_PROJECT_NAME fake
WORKDIR /src
COPY *.csproj .
RUN dotnet restore .

COPY . .
RUN dotnet build .

ENTRYPOINT [ "dotnet", "test", "--verbosity=normal" ]
