FROM mcr.microsoft.com/powershell:latest

RUN pwsh -c Set-PSRepository PSGallery -InstallationPolicy Trusted; \
    pwsh -c Install-Module -Name PSScriptAnalyzer > /dev/null

WORKDIR /powershell

ENTRYPOINT [ "pwsh", "-c", "Invoke-ScriptAnalyzer", "-Recurse", "-Path" ]
