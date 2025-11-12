# docker complete purge

remove all docker containers, images, volumes, networks, and build cache:

```bash
docker stop $(docker ps -aq) 2>/dev/null && docker rm $(docker ps -aq) 2>/dev/null
docker system prune -a --volumes --force && docker builder prune -af
docker network prune -f
osascript -e 'quit app "Docker"' && sleep 3 && open -a Docker
```

**one-liner (without restart):**
```bash
docker stop $(docker ps -aq) 2>/dev/null; docker rm $(docker ps -aq) 2>/dev/null; docker system prune -a --volumes --force; docker builder prune -af; docker network prune -f
```

this removes:
- all running and stopped containers
- all images (including tagged)
- all volumes
- all custom networks
- all build cache and history

