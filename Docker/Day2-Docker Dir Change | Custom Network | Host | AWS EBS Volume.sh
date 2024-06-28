#check the current root volume usage  (43%)
df -h
#download image/create a container & check the current root volume usage (46%)
docker run --rm --name frontend -p 8000:80 nginx
df -h
#if you keep on downloading images/creating containers the root volume reaches to 100%

#Process to change the docker directory

