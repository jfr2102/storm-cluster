#!/bin/bash
git pull
./removestack.sh
./stackbuild.sh
./push.sh
sleep 5s
./deploy.sh
sleep 1m
./deploytopology.sh