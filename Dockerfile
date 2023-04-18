ARG WINVER=17763.2803
FROM mcr.microsoft.com/windows/servercore:10.0.$WINVER
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ADD https://github.com/StefanScherer/docker-cli-builder/releases/download/20.10.9/docker.exe C:/docker.exe
COPY docker-entrypoint.ps1 /
COPY cleanup.ps1 /

ENV CLEANUP_RATE 86400

ENTRYPOINT [ "powershell.exe"]
CMD ["C:/docker-entrypoint.ps1"]