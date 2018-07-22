# psscriptanalyzer-docker

[![pipeline status](https://gitlab.com/4x0v7/psscriptanalyzer-docker/badges/master/pipeline.svg)](https://gitlab.com/4x0v7/psscriptanalyzer-docker/commits/master)

## Build and Run

    docker build -t script-analyzer .
    docker run -t -v ${PWD}:/powershell script-analyzer .
