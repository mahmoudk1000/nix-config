{
  pkgs,
  ...
}:

let
  name = "blum";
in
pkgs.writeScriptBin name ''
  divider="---------"
  goback="Back"

  power_on() {
    if bluetoothctl show | grep -q "Powered: yes"; then
      return 0
    else
      return 1
    fi
  }

  toggle_power() {
    if power_on; then
      bluetoothctl power off
        show_menu
    else
      if rfkill list bluetooth | grep -q 'blocked: yes'; then
        rfkill unblock bluetooth && sleep 3
      fi
      bluetoothctl power on
      show_menu
    fi
  }

  scan_on() {
    if bluetoothctl show | grep -q "Discovering: yes"; then
      echo "Scan: on"
      return 0
    else
      echo "Scan: off"
      return 1
    fi
  }

  toggle_scan() {
    if scan_on; then
      kill $(pgrep -f "bluetoothctl scan on")
      bluetoothctl scan off
      show_menu
    else
      bluetoothctl scan on &
      echo "Scanning..."
      sleep 5
      show_menu
    fi
  }

  pairable_on() {
    if bluetoothctl show | grep -q "Pairable: yes"; then
      echo "Pairable: on"
      return 0
    else
      echo "Pairable: off"
      return 1
    fi
  }

  toggle_pairable() {
    if pairable_on; then
      bluetoothctl pairable off
      show_menu
    else
      bluetoothctl pairable on
      show_menu
    fi
  }

  discoverable_on() {
    if bluetoothctl show | grep -q "Discoverable: yes"; then
      echo "Discoverable: on"
      return 0
    else
      echo "Discoverable: off"
      return 1
    fi
  }

  toggle_discoverable() {
    if discoverable_on; then
      bluetoothctl discoverable off
      show_menu
    else
      bluetoothctl discoverable on
      show_menu
    fi
  }

  device_connected() {
    device_info=$(bluetoothctl info "$1")
    if echo "$device_info" | grep -q "Connected: yes"; then
      return 0
    else
      return 1
    fi
  }

  toggle_connection() {
    if device_connected $1; then
      bluetoothctl disconnect $1
      device_menu "$device"
    else
      bluetoothctl connect $1
      device_menu "$device"
    fi
  }

  device_paired() {
    device_info=$(bluetoothctl info "$1")
    if echo "$device_info" | grep -q "Paired: yes"; then
      echo "Paired: yes"
      return 0
    else
      echo "Paired: no"
      return 1
    fi
  }

  toggle_paired() {
    if device_paired $1; then
      bluetoothctl remove $1
      device_menu "$device"
    else
      bluetoothctl pair $1
      device_menu "$device"
    fi
  }

  device_trusted() {
    device_info=$(bluetoothctl info "$1")
    if echo "$device_info" | grep -q "Trusted: yes"; then
      echo "Trusted: yes"
      return 0
    else
      echo "Trusted: no"
      return 1
    fi
  }

  toggle_trust() {
    if device_trusted $1; then
      bluetoothctl untrust $1
      device_menu "$device"
    else
      bluetoothctl trust $1
      device_menu "$device"
    fi
  }

  print_status() {
    if power_on; then
      printf 'On'
    else
      echo 'Off'
    fi
  }

  device_menu() {
    device=$1

    # Get device name and mac address
    device_name=$(echo $device | cut -d ' ' -f 3-)
    mac=$(echo $device | cut -d ' ' -f 2)

    # Build options
    if device_connected $mac; then
      connected="Connected: yes"
    else
      connected="Connected: no"
    fi

    paired=$(device_paired $mac)
    trusted=$(device_trusted $mac)
    options="$connected\n$paired\n$trusted\n$divider\n$goback\nExit"

    chosen="$(echo -e "$options" | $rofi_command "$device_name")"

    case $chosen in
      "" | $divider)
        echo "No option chosen."
      ;;
      $connected)
        toggle_connection $mac
      ;;
      $paired)
        toggle_paired $mac
      ;;
      $trusted)
        toggle_trust $mac
      ;;
      $goback)
        show_menu
      ;;
    esac
  }

  show_menu() {
    if power_on; then
      power="Power: on"

      devices=$(bluetoothctl devices | grep Device | cut -d ' ' -f 3-)

      scan=$(scan_on)
      pairable=$(pairable_on)
      discoverable=$(discoverable_on)

      options="$devices\n$divider\n$power\n$scan\n$pairable\n$discoverable\nExit"
    else
      power="Power: off"
      options="$power\nExit"
    fi

    chosen="$(echo -e "$options" | $rofi_command " 󰂯")"

    case $chosen in
      "" | $divider)
        echo "No option chosen."
      ;;
      $power)
        toggle_power
      ;;
      $scan)
        toggle_scan
      ;;
      $discoverable)
        toggle_discoverable
      ;;
      $pairable)
        toggle_pairable
      ;;
      *)
        device=$(bluetoothctl devices | grep "$chosen")
        # Open a submenu if a device is selected
        if [[ $device ]]; then device_menu "$device"; fi
      ;;
    esac
  }

  rofi_command="rofi -dmenu -no-fixed-num-lines -i -p"

  case "$1" in
    --status)
      print_status
    ;;
    *)
      show_menu
    ;;
  esac
''
