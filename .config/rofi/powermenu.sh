#!/usr/bin/env bash

# Configuração de tema
theme="$HOME/.config/rofi/powermenu.rasi"

# Opções com ícones (Nerd Fonts)
shutdown=" Desligar"
reboot=" Reiniciar"
lock=" Bloquear"
suspend=" Suspender"
logout=" Sair (Logout)"

# Confirmação
yes=' Sim'
no=' Não'

# Monta a lista de opções
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

# Abre o Rofi e captura a escolha
chosen="$(echo -e "$options" | rofi -dmenu -p "Sessão" -theme "${theme}")"

# Lógica de execução
case ${chosen} in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        # Ajuste aqui para seu locker (hyprlock ou swaylock)
        hyprlock || swaylock
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        hyprctl dispatch exit
        ;;
esac
