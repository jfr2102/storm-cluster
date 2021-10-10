#!/bin/bash
docker node update --label-add Storm-nodes=true --label-add supervisors=1 --label-add nimbus=true benchmark-johannes-large-1
docker node update --label-add Storm-nodes=true --label-add supervisors=1 benchmark-johannes-large-2
docker node update --label-add Storm-nodes=true --label-add supervisors=2 benchmark-johannes-large-3
docker node update --label-add Kakfa=true benchmark-johannes-large-4
docker node update --label-add Utilities=true benchmark-johannes-large-5