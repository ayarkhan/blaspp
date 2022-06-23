#!/bin/bash

for maker in make cmake; do
   [[ -z "$MAKER" || "$maker" = "$MAKER" ]] || continue
   for device in cpu gpu_amd gpu_nvidia; do
      [[ -z "$DEVICE" || "$device" = "$DEVICE" ]] || continue
      for action in configure build install test smoke_test; do
         [[ -z "$ACTION" || "$action" = "$ACTION" ]] || continue
         echo $action $device $maker
         ./$action.sh $maker $device
      done
   done
done

