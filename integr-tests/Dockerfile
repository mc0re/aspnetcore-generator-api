FROM microsoft/dotnet:2.2-sdk
WORKDIR /src
COPY *.csproj .
RUN dotnet restore .

COPY . .
RUN dotnet build .

ENTRYPOINT [ "dotnet", "test" ]
