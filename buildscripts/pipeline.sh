#!/bin/bash
git pull
nohup ./removestack.sh
nohup ./stackbuild.sh
nohup ./push.sh
sleep 5s
./deploy.sh
sleep 1m
./deploytopology.sh