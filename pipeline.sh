#!/bin/bash
git pull
./removestack.sh
./stackbuild.sh
./push.sh
./deploy.sh
sleep 1m
./deploytoplogy.sh
sleep 1m
./testdriver.sh