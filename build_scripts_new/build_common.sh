#!/bin/bash

#########################################################
# This file contains functions common to all the scripts
# Each script sour 'source' this file at the beginning.
#########################################################



# Toolchain Selection GUI
# Since each sub-script will want to ask the user what toolchain to use, we will keep a common interface in this file.
# $1 = env variable to save TOOLCHAIN_SETUP_NAME
# $2 = env variable to save TOOLCHAIN_SETUP
select_toolchain() {

    SELECT=$(whiptail --title "Toolchain setup" --menu "You may use ESC+ESC to cancel.\nEnter the command line you want to run before build.\n" 0 0 0 \
	"1  SDK Toolchain (Rocko/Poky 2.4.3)" "  /opt/poky/2.4.3/environment-setup-aarch64-poky-linux" \
	"2  Linaro gcc-linaro-7.5.0-2019.12" "  /opt/linaro/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu" \
	"3  ARM gcc-arm-10.2-2020.11" "  /opt/arm/gcc-arm-10.2-2020.11-x86_64-aarch64-none-elf" \
	"0  (none)" "  No setup" \
	3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 0 ] ; then
    case "$SELECT" in
      1\ *)
      		x_TOOLCHAIN_SETUP_NAME="SDK Toolchain (Poky 2.4.3)"
      		x_TOOLCHAIN_SETUP="source /opt/poky/2.4.3/environment-setup-aarch64-poky-linux" ;;
      2\ *)
      		x_TOOLCHAIN_SETUP_NAME="Linaro gcc-linaro-7.5.0-2019.12"
      		x_TOOLCHAIN_SETUP="PATH=/opt/linaro/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin:\$PATH ; export CROSS_COMPILE=aarch64-linux-gnu-" ;;
      3\ *)
      		x_TOOLCHAIN_SETUP_NAME="ARM gcc-arm-10.2-2020.11"
      		x_TOOLCHAIN_SETUP="PATH=/opt/arm/gcc-arm-10.2-2020.11-x86_64-aarch64-none-elf/bin:\$PATH ; export CROSS_COMPILE=aarch64-none-elf-" ;;
      0\ *)
		x_TOOLCHAIN_SETUP_NAME="(none)"
		x_TOOLCHAIN_SETUP= ;;
      *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $SELECT" 20 60 1
  fi

  DO_SET="export $1=\"$x_TOOLCHAIN_SETUP_NAME\""
  eval "$DO_SET"

  DO_SET="export $2=\"$x_TOOLCHAIN_SETUP\""
  eval "$DO_SET"
}


read_setting() {
  if [ -e "$SETTINGS_FILE" ] ; then
    source "$SETTINGS_FILE"
  else
    echo -e "\nERROR: Settings file ($SETTINGS_FILE) not found."
    exit
  fi
}

# $1 = env variable to save
# $2 = value
# Remember, we we share this file with other scripts, so we only want to change
# the lines used by this script
save_setting() {


  if [ ! -e $SETTINGS_FILE ] ; then
    touch $SETTINGS_FILE # create file if does not exit
  fi

  # Do not change the file if we did not make any changes
  grep -q "^$1=$2$" $SETTINGS_FILE
  if [ "$?" == "0" ] ; then
    return
  fi

  sed '/^'"$1"'=/d' -i $SETTINGS_FILE
  echo  "$1=$2" >> $SETTINGS_FILE

  # Delete empty or blank lines
  sed '/^$/d' -i $SETTINGS_FILE

  # Sort the file to keep the same order
  sort -o $SETTINGS_FILE $SETTINGS_FILE
}


