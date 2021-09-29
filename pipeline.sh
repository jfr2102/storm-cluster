#!/bin/bash
git pull
./removestack.sh
./stackbuild.sh
./push.sh
sleep 30s
./deploy.sh
sleep 30s
./deploytopology.sh