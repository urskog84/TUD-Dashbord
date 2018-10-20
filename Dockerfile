from mcr.microsoft.com/powershell

SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Install-Module UniversalDashboard.Community -AcceptLicense -Force

ADD ./src/ ./src/


SHELL ["pwsh"] 
ENTRYPOINT ./src/start.ps1

