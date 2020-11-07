#!/bin/bash
#####################################################################################
# Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved.

# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto. Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.
#####################################################################################

# Parameter "-r" represents the robot ID (to determine which Carter is being used).
# Parameter "-m" represents determines the map.
# Parameter "-o" represents determines the operator name.
# First two options have default values in case they're not provided.
# Application terminates if operator name is not provided.

while getopts :m:r:o: option
do
  case ${option} in
    m) MAP=${OPTARG};;
    r) ROBOT_ID=${OPTARG};;
    o) OPERATOR=${OPTARG};;
    *) break;
  esac
done
shift $((OPTIND -1))

if [ -z $ROBOT_ID ]
then
  ROBOT_ID="2"
fi

if [ -z $MAP ]
then
  MAP="nvidia_R_meeting_rooms_181213b"
fi

if [ -z $OPERATOR ]
then
  echo 'Please provide operator name using option -o'
  exit 1
fi

# Please do not indent strings like below
engine/alice/tools/main --app apps/carter/carter_delivery/carter_delivery.app.json \
--config "apps/carter/robots/carter_$ROBOT_ID.config.json,apps/assets/maps/$MAP.config.json,\
apps/carter/carter_delivery/operators/operator_$OPERATOR.config.json" \
--graph "apps/assets/maps/$MAP.graph.json" $@
