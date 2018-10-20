from mcr.microsoft.com/powershell

ADD ./src/ ./src/


SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
CMD Install-Module UniversalDashboard.Community -AcceptLicense -Force
ENTRYPOINT [ "pwsh ./src/start.ps1" ]

