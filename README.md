# Cleanup your docker daemon periodically (Windows version)

## Reason

I am running a gitlab worker for building my arm docker images.
Usally it takes a few weeks until the worker is out of disk space.

To prevent this problem I created this small docker utility.

## Cleanup

The following commands will be triggered on startup of the container.

```sh
docker system prune -f --all --volumes
```

This will delete all unused containers, unbound volumes and unused images.

After the cleanup-commands are processed the container will delay the cleanup
for the next 24 hours.

## Advise about persistent data

**Please be aware that volumes may contain data that should be persisted!
Use this image only if you don't store any persistent data on docker volumes!**

## Usage

You can add this container to your docker-compose setup like shown below.

```yaml
  cleanup:
    image: zdfmfi.azurecr.io/gbas/cleanup-docker
    depends_on:
      ...
    volumes:
      - type: npipe
        source: \\.\pipe\docker_engine
        target: \\.\pipe\docker_engine
    deploy:
      replicas: 1
      restart_policy:
        condition: on-failure
```

## Parameters

The interval of the cleanup (default 24 hours) can be configured through
the environment variable CLEANUP_RATE specified in seconds.