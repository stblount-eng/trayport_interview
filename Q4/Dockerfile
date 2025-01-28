FROM mcr.microsoft.com/dotnet/sdk:9.0-alpine AS build
WORKDIR /src

COPY Q4/*.sln .
COPY Q4/ConsoleApp/*.csproj ConsoleApp/
COPY Q4/Tests/*.csproj Tests/

RUN dotnet restore

COPY . .

RUN dotnet test --no-restore

RUN dotnet publish ConsoleApp/ConsoleApp.csproj -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/runtime:9.0-alpine AS runtime

RUN addgroup -g 10001 appgroup && \
    adduser -u 10001 -G appgroup -s /sbin/nologin -D appuser

WORKDIR /app

COPY --from=build --chown=appuser:appuser /app/publish .

USER appuser

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD dotnet --info || exit 1

ENTRYPOINT ["dotnet", "ConsoleApp.dll"]