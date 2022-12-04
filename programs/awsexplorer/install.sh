#!/bin/bash

# clone the repo
ghq get -l teadeveloper/awscloudexplorer.git
# Create virtual environment
python3 -m venv ./venv && source venv/bin/activate
# Install pre-reqs for
pip install -r requirements.txt
#Run cloud explorer
python cloudexplorer.py
