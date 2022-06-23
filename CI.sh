#!/bin/bash

mkdir -p logs
for maker in make cmake; do
   [[ -z "$MAKER" || "$maker" = "$MAKER" ]] || continue
   for device in cpu gpu_amd gpu_nvidia; do
      [[ -z "$DEVICE" || "$device" = "$DEVICE" ]] || continue
      echo -n "maker=$maker device=$device:"
      for action in configure build; do
         [[ -z "$ACTION" || "$action" = "$ACTION" ]] || continue
         echo -n " $action"
         .github/workflows/$action.sh $maker $device > logs/${maker}_${device}_${action}.log 2>&1
         if [ $? = 0 ]; then
            echo -n "(pass)"
         else
            echo -n "(fail)"
            break
         fi
      done
      echo
   done
done


