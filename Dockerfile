FROM mcr.microsoft.com/powershell:ubuntu-16.04

RUN set -eux pipefail; \
    pwsh -c 'Get-Variable PSVersionTable | Select-Object -ExpandProperty Value'; \
    pwsh -c Set-PSRepository -Name PSGallery -InstallationPolicy Trusted -ErrorAction Stop -Verbose; \
    pwsh -c Install-Module -Name PSScriptAnalyzer -ErrorAction Stop -Verbose; \
    pwsh -c 'Get-InstalledModule -Name PSScriptAnalyzer -ErrorAction Stop | Select-Object *'

WORKDIR /powershell

ENTRYPOINT [ "pwsh", "-c" ]
CMD [ "Invoke-ScriptAnalyzer", "-EnableExit", "-Recurse", "-Path" ]
