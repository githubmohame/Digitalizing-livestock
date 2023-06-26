#!/usr/bin/env bash
set -e
source "/home/mohamed/IdeaProjects/MainFinalProject/backend_env/bin/activate"

python -u  "/home/mohamed/IdeaProjects/MainFinalProject/database/farmer/bash_script_farmer.py" "$1" "$2" "$3"