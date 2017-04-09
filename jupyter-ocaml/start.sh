#!/bin/bash
eval `opam config env`
jupyter notebook --no-browser --config /home/jupyter/jupyter_notebook_config.py
