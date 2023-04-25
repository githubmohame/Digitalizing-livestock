#!/usr/bin/env bash
set -e
source "/home/mohamed/IdeaProjects/MainFinalProject/backend_env/bin/activate"

python -u  /home/mohamed/IdeaProjects/MainFinalProject/database/farms/bash_script_farm.py  "$1" "$2" "$3"