#!/bin/bash

# Получаем данные о памяти с помощью команды vm_stat
memory_info=$(vm_stat)

# Извлекаем значения из вывода команды
# Pages в macOS представляют собой блоки памяти размером 4096 байтов

# Сумма всех страниц памяти
total_pages=$(echo "$memory_info" | grep "Pages free" | awk '{print $3}' | tr -d '.')

# Количество страниц, используемых приложениями
app_pages=$(echo "$memory_info" | grep "Pages active" | awk '{print $3}' | tr -d '.')

# Количество страниц, неиспользуемых приложениями, но сохраненных на диске
inactive_pages=$(echo "$memory_info" | grep "Pages inactive" | awk '{print $3}' | tr -d '.')

# Количество страниц, используемых операционной системой для файловой системы и кэша
wired_pages=$(echo "$memory_info" | grep "Pages wired" | awk '{print $3}' | tr -d '.')

# Размер страницы в байтах
page_size=4096

# Вычисляем общий объем памяти и используемой памяти
total_memory=$((total_pages * page_size / (1024 * 1024)))
used_memory=$(( (app_pages + inactive_pages + wired_pages) * page_size / (1024 * 1024)))

# Вычисляем свободную память
free_memory=$((total_memory - used_memory))

# Выводим результат
echo "Общий объем памяти: $total_memory MB"
echo "Использовано: $used_memory MB"
echo "Свободно: $free_memory MB"
