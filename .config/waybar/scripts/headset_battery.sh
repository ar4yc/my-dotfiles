#!/bin/bash

DEVICE="/org/freedesktop/UPower/devices/headset_dev_40_58_99_3C_BF_1C"

# Получаем процент (только цифры), ошибки игнорируем
percentage=$(upower -i "$DEVICE" 2>/dev/null | awk '/percentage/ {print $2}' | tr -d '%')

# Проверяем: если строка пустая ИЛИ равна 0
if [[ -z "$percentage" || "$percentage" -eq 0 ]]; then
    # Выводим пустой текст (модуль скроется) или кастомную надпись
    echo '{"text": "  Disconnected", "tooltip": "Headset is off or 0%", "class": "disconnected"}'
else
    # Если заряд больше 0, выводим JSON
    printf '{"text": "  %s%%", "tooltip": "Headset: %s%%", "class": "connected"}\n' "$percentage" "$percentage"
fi

