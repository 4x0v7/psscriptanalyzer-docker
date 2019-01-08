FROM mcr.microsoft.com/powershell:ubuntu-16.04
SHELL [ "pwsh", "-c" ]
RUN Get-Variable PSVersionTable | Select-Object -ExpandProperty Value; \
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted -ErrorAction Stop -Verbose; \
    Install-Module -Name PSScriptAnalyzer -ErrorAction Stop -Verbose; \
    Get-InstalledModule -Name PSScriptAnalyzer -ErrorAction Stop | Select-Object *

WORKDIR /powershell

ENTRYPOINT [ "pwsh", "-c" ]
CMD [ "Invoke-ScriptAnalyzer", "-EnableExit", "-Recurse", "-Path", "." ]
