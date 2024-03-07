#!/bin/bash

# Читаем информацию о памяти из /proc/meminfo
mem_info=$(</proc/meminfo)

# Извлекаем нужные данные
total_memory=$(echo "$mem_info" | grep -i "MemTotal" | awk '{print $2}')
free_memory=$(echo "$mem_info" | grep -i "MemFree" | awk '{print $2}')
buffers=$(echo "$mem_info" | grep -i "Buffers" | awk '{print $2}')
cached=$(echo "$mem_info" | grep -i "^Cached" | awk '{print $2}')
used_memory=$((total_memory - free_memory - buffers - cached))

# Переводим байты в мегабайты для удобства чтения
total_memory_mb=$((total_memory / 1024))
used_memory_mb=$((used_memory / 1024))
free_memory_mb=$((free_memory / 1024))

# Выводим результат
echo "Общий объем памяти: $total_memory_mb MB"
echo "Использовано: $used_memory_mb MB"
echo "Свободно: $free_memory_mb MB"

