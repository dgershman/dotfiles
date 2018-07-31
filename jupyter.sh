#!/bin/sh

docker rm -f jupyter
docker run -d --name=jupyter -v ~/.dotfiles/jupyter-notebooks:/home/jovyan/work -p 8888:8888 jupyter/datascience-notebook
docker exec -it jupyter /bin/sh "/home/jovyan/work/install-requirements.sh"
