#!/bin/bash

# Получаем данные о памяти с помощью команды free
memory_info=$(free -m)

# Извлекаем строки, содержащие информацию об использовании памяти
memory_usage=$(echo "$memory_info" | grep Mem)

# Извлекаем значения из строки, используя awk
total_memory=$(echo "$memory_usage" | awk '{print $2}')
used_memory=$(echo "$memory_usage" | awk '{print $3}')
free_memory=$(echo "$memory_usage" | awk '{print $4}')

# Выводим результат
echo "Общий объем памяти: $total_memory MB"
echo "Использовано: $used_memory MB"
echo "Свободно: $free_memory MB"
