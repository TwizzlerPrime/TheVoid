#!/bin/bash

Health=100
Energy=50

echo "Welcome to The Void... you're cooked pal."
sleep 2
echo "You are lost in a dark well of corruption; you may not survive."
sleep 2

display_status() {
	echo "Health: $Health"
	echo "Energy: $Energy"
	echo ""
}

echo "A silhouette of the Reaper dawns upon you, and he asks: 'Do you wish to tresspass unto my territory?'"
sleep 2
read -p "Make your move. (yes/no):" proceed

if [[ $proceed == "no" ]]; then
	echo "Coward, leave this place and never return."
	exit 0
elif [[ $proceed == "yes" ]]; then
	echo "I pity you and your confidence, good luck."
	display_status
	echo ""
fi
sleep 2
echo "As you enter what seems to be a cavern, you spot a portal, a collapsing cave, and .. a book?"
sleep 2
echo "What will you inspect?"

while true; do
read -p "Decide: portal,cave,book: " choice

if [[ $choice == "portal" ]]; then
	echo "You approach the portal, but you get dizzy and are whisked away to a different section of the void."
	sleep 1
	echo "You lost energy!"
Energy=$((Energy - 10))
       display_status
	break

elif [[ $choice == "cave" ]]; then
     echo "The cave you enter seems to have been struck by a mysterious force."
	sleep 1
	echo "The cave collapses, and you have been hit by a few boulders."	
	sleep 1
	echo "You lost health!"
	Health=$((Health - 20))
        display_status
	break

elif [[ $choice == "book" ]]; then
	echo "A surge of willpower flows through you, something tells you you must find more.."
        Energy=$((Energy + 10))
	Health=$((Health + 10))
	sleep 1
	echo "You got more health and energy!"
	display_status
	break
else
echo "You stand there, confused, waiting for something to happen..(try again)"
fi
done

sleep 2
echo "You enter the Sanctuary, the homes of the Darkhearts and alchemists."
sleep 2
sanctuary_encounter() {
    local sword_energy=10
    local pulsegun_energy=15
    local spell_energy=20
while true; do

	read -p "Suddenly, pulsating, weaponized energy barely misses you; a Darkheart has spotted you! What now? (sword, spell, pulsegun)" defense

if [[ $defense == "sword" && $Energy -ge $sword_energy ]]; then
	echo "When the Darkheart attacks, you parry the attack and deflect it back, defeating it."
	Energy=$((Energy - sword_energy))
	break

elif [[ $defense == "pulsegun" && $Energy -ge $pulsegun_energy ]]; then
         echo "You fire your pulsegun, landing a direct hit and killing the Darkheart!"
         Energy=$((Energy - pulsegun_energy))
	 break
elif [[ $defense == "spell"  && $Energy -ge  $spell_energy ]]; then
	echo "you cast a basic spell, but its strong enough to subdue the Darkheart!"
	Energy=$((Energy - spell_energy))
	break
     fi 
 done
}

sanctuary_encounter
sleep 2
echo "The Darkheart might have some interesting loot, but its body is volatile."
sleep 1
read -p "Do you scavenge it? (yes/no)" scavenge

while true; do
  if [[ $scavenge == "no" ]]; then
	echo "You move on, leaving it behind.."
	break
  elif [[ "$scavenge" == "yes" ]]; then
	echo "You're overwhelmed with a Darkheart's power, it strengthens you."
	Energy=$((Energy + 60))
	Health=$((Health + 100))
	echo "You have recieved a massive bost in stats!"
	break
   
else
	echo "You sit down and contemplate.. (pick)"
  fi
done
display_status