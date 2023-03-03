# AFFiNE-Composer

## Introduction

Automatic build and start up AFFiNE development environment

## How to start up

### Download the repository:

```bash
git clone --recursive https://github.com/ZoneTwelve/AFFiNE-Composer
# or
git clone --recursive git@github.com:ZoneTwelve/AFFiNE-Composer.git
```

### Update the submodules

fetch the new version of AFFiNE

```
git submodule update --remote
```

### Build and Start

Linux: 
```
./start.sh
```

Windows:
```
xcopy Dockerfile ./app/Dockerfile
docekr-compose up -d
```
