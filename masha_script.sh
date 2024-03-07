#!/bin/bash

current_date=$(date +"%A, %d %B %Y")
wishes=("Хорошего дня!" "Улыбнитесь!" "Будьте счастливы!")

random_wish=${wishes[$RANDOM % ${#wishes[@]}]}

echo "Сегодня $current_date"
echo $random_wish
