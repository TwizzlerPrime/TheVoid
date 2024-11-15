#!/bin/bash

while true; do
read -p "Do you scavenge it? (yes/no)" scavenge

  if [[ $scavenge == "no" ]]; then
        echo "You move on, leaving it behind.."
        break
  elif [[ "$scavenge" == "yes" ]]; then

        if (( RANDOM % 2 == 0)); then
                echo "The Darkheart explodes! You take damage."
		break
 fi
    done
