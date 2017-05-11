#!/bin/sh

docker run -it --rm -v ~/.dotfiles/jupyter-notebooks:/home/jovyan/work -p 8787:8888 jupyter/datascience-notebook
