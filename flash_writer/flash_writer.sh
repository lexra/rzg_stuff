#!/bin/bash

if [ "$1" == "" ] ; then
  export FW_GUI_MODE=1
fi

# Set BOARD_NAME and SW_SETTINGS
switch_settings() {
  if [ "$BOARD" == "ek874" ] ; then
	BOARD_NAME="EK874 RZ/G2E by Silicon Linux"
	SW_SETTINGS="Please TURN OFF board power when changing switch settings.
Switch settings for SW12 which is placed near the micro SD card slot.

	SPI Flash boot              eMMC boot
	--------------              ---------
	1 = ON                      1 = OFF
	2 = ON                      2 = ON
	3 = ON                      3 = OFF
	4 = OFF                     4 = OFF
	5 = ON                      5 = ON
	6 = ON                      6 = ON

	SCIF Download mode         USB Download mode
	------------------         -----------------
	1 = OFF                    1 = OFF
	2 = OFF                    2 = OFF
	3 = OFF                    3 = ON
	4 = OFF                    4 = OFF
	5 = ON                     5 = ON
	6 = ON                     6 = ON
"
  fi

  if [ "$BOARD" == "hihope-rzg2m" ] || [ "$BOARD" == "hihope-rzg2n" ] || \
     [ "$BOARD" == "hihope-rzg2h" ] ; then

	if [ "$BOARD" == "hihope-rzg2m" ] ; then BOARD_NAME="HiHope RZ/G2M by Hoperun Technology" ; fi
	if [ "$BOARD" == "hihope-rzg2n" ] ; then BOARD_NAME="HiHope RZ/G2N by Hoperun Technology" ; fi
	if [ "$BOARD" == "hihope-rzg2h" ] ; then BOARD_NAME="HiHope RZ/G2H by Hoperun Technology" ; fi

	SW_SETTINGS="Please TURN OFF board power when changing switch settings.
Switch settings for SW1002.
    ----------  ----------
    | SW1003 |  | SW1002 | << this one
    ----------  ----------
                ----------
                | SW1001 |
                ----------

	SPI Flash boot              eMMC boot
	--------------              ---------
	1 = ON                      1 = ON
	2 = ON                      2 = ON
	3 = ON                      3 = ON
	4 = ON                      4 = ON
	5 = ON                      5 = OFF
	6 = OFF                     6 = OFF
	7 = ON                      7 = ON
	8 = ON                      8 = OFF

	SCIF Download mode         USB Download mode
	------------------         -----------------
	1 = ON                      1 = ON
	2 = ON                      2 = ON
	3 = ON                      3 = ON
	4 = ON                      4 = ON
	5 = OFF                     5 = OFF
	6 = OFF                     6 = OFF
	7 = OFF                     7 = OFF
	8 = OFF                     8 = ON
"
  fi
}

clear_filenames() {
  unset FLASHWRITER
  unset SA0_FILE
  unset BL2_FILE
  unset SA6_FILE
  unset BL31_FILE
  unset UBOOT_FILE
}

# Use this function to determine if any config settings have changed
config_hash() {
  CONFIG_HASH_RESULT=$(echo "$BOARD" \
  "$FLASH" \
  "$SERIAL_DEVICE_INTERFACE" \
  "$FILES_DIR" \
  "$FLASHWRITER" \
  "$SA0_FILE" \
  "$BL2_FILE" \
  "$SA6_FILE" \
  "$BL31_FILE" \
  "$UBOOT_FILE" \
  | md5sum)
}

# Use this function to determine if any app settings have changed
settings_hash() {
  SETTINGS_HASH_RESULT=$(echo "$CONFIG_FILE" \
  "$NEWT_COLORS" \
  | md5sum)
}

# Check if flash_writer binary has already been downloaded
check_fw_first() {

	unset CMD_ABORT
	
	if [ "$FW_NOT_DL_YET" == "1" ] ; then
		ANSWER=$(whiptail --yesno "WARNING: The Flash writer binary has not been downloaded yet.\n\nContinue?" 0 0 3>&1 1>&2 2>&3; echo $?)
		# 0=yes, 1=no
		if [ "$ANSWER" != "0" ] ; then
			CMD_ABORT=1
		else
			# Set to "2" so we only warn once
			export FW_NOT_DL_YET=2
		fi
	fi
}

# Common settings for Renesas boards
set_filenames() {

  if [ "$BOARD" == "ek874" ] || [ "$BOARD" == "hihope-rzg2m" ] || \
     [ "$BOARD" == "hihope-rzg2n" ] || [ "$BOARD" == "hihope-rzg2h" ] ; then

	if [ "$FILES_DIR" == "" ] ; then
		FILES_DIR="."
	fi
	if [ "$FLASHWRITER" == "" ] ; then
		if [ "$BOARD" == "hihope-rzg2m" ] || [ "$BOARD" == "hihope-rzg2n" ] || [ "$BOARD" == "hihope-rzg2h" ] ; then
			FLASHWRITER=$FILES_DIR/AArch64_Flash_writer_SCIF_DUMMY_CERT_E6300400_hihope.mot
		else
			FLASHWRITER=$FILES_DIR/AArch64_Flash_writer_SCIF_DUMMY_CERT_E6300400_${BOARD}.mot
		fi
	fi
	if [ "$SA0_FILE" == "" ] ; then
		SA0_FILE=$FILES_DIR/bootparam_sa0.srec
	fi
	if [ "$BL2_FILE" == "" ] ; then
		BL2_FILE=$FILES_DIR/bl2-${BOARD}.bin
	fi
	if [ "$SA6_FILE" == "" ] ; then
		SA6_FILE=$FILES_DIR/cert_header_sa6.srec
	fi
	if [ "$BL31_FILE" == "" ] ; then
		BL31_FILE=$FILES_DIR/bl31-${BOARD}.bin
	fi
	if [ "$UBOOT_FILE" == "" ] ; then
		#UBOOT_FILE=$FILES_DIR/u-boot-elf-${BOARD}.srec
		UBOOT_FILE=$FILES_DIR/u-boot.bin
	fi
  fi

  # For any file that does not exist, look to see if they are
  # in sub-directories because they were build outside of Yocto

  # Flash Writer
  if [ ! -e "$FLASHWRITER" ] ; then
    FLASHWRITER_TMP=`find ../../rzg2_flash_writer/AArch64_output/*.mot`
    if [ -e "$FLASHWRITER_TMP" ] ; then FLASHWRITER=$FLASHWRITER_TMP ; fi
  fi

  # arm-trusted-firmware
  if [ "$FLASH" == "0" ] ; then
    DEPLOY_DIR=z_deploy_spi
  else
    DEPLOY_DIR=z_deploy_emmc
  fi
  if [ ! -e "$SA0_FILE" ] ; then
    # If we find the sa0 file, then we know the other files should be there too
    SA0_FILE_TMP=$FILES_DIR/arm-trusted-firmware/$DEPLOY_DIR/bootparam_sa0.srec
    if [ -e "$SA0_FILE_TMP" ] ; then
      SA0_FILE=$FILES_DIR/arm-trusted-firmware/$DEPLOY_DIR/bootparam_sa0.srec
      BL2_FILE=$FILES_DIR/arm-trusted-firmware/$DEPLOY_DIR/bl2-${BOARD}.bin
      SA6_FILE=$FILES_DIR/arm-trusted-firmware/$DEPLOY_DIR/cert_header_sa6.srec
      BL31_FILE=$FILES_DIR/arm-trusted-firmware/$DEPLOY_DIR/bl31-${BOARD}.bin
   fi
  fi

  # u-boot
  if [ ! -e "$UBOOT_FILE" ] ; then
    UBOOT_FILE_TMP=$FILES_DIR/renesas-u-boot-cip/.out_${BOARD}/u-boot.bin
    if [ -e "$UBOOT_FILE_TMP" ] ; then UBOOT_FILE=$UBOOT_FILE_TMP ; fi
  fi
}

do_menu_config() {
  SELECT=$(whiptail --title "Config File Selection" --menu "You may use ESC+ESC to cancel.\n\nHow do you want to select the file?" 0 0 0 \
	"1 File Browse" "  Use a GUI File broswer " \
	"2 Enter"        "  Manual enter the filename." \
	3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 0 ] ; then
    case "$SELECT" in
      1\ *) 
		which zenity > /dev/null
		if [ "$?" != "0" ] ; then
			whiptail --yesno "ERROR: You need the (small) \"zenity\" dialog box utility installed.\nYou can install by running:\n\n$ sudo apt-get install zenity\n\nRun that command now to install?" 0 0 0
			if [ "$?" == "0" ] ; then
				echo "sudo apt-get install zenity"
				sudo apt-get install zenity
				echo "--------------------------"
				echo " Install complete"
				echo "--------------------------"
				sleep 2
				do_menu_config
			fi
		else
			FILE=`zenity --file-selection --filename="$CONFIG_FILE"  --file-filter=*.ini --title="Select your config file (*.ini)"`
			case $? in
			0)
				# Strip out the full path if it is in the same directory
				PWD="$(pwd)/"
				SELECT=$(echo $FILE | sed "s:$PWD::")
				CONFIG_FILE="$SELECT"
				source "$CONFIG_FILE"
				config_hash
				CONFIG_HASH=$CONFIG_HASH_RESULT
				;;
			-1)
				whiptail --msgbox "An unexpected error has occurred." 0 0 0
				;;
			esac
		fi
		;;
      2\ *) 
		SELECT=$(whiptail --title "Config File Selection" --inputbox "You may use ESC+ESC to cancel.\n\n Enter the filename to your config file." 0 100 \
		"config.ini"  \
		3>&1 1>&2 2>&3)
		RET=$?
		if [ $RET -eq 0 ] ; then

			if [ ! -e "$SELECT" ] ; then
				whiptail --msgbox "New file?\n\nFile \"$SELECT\" does not exist.\nThis file will be created if you save and exit.\n" 0 0 0
			fi
			CONFIG_FILE="$SELECT"
			source "$CONFIG_FILE"
			config_hash
			CONFIG_HASH=$CONFIG_HASH_RESULT
		fi
		;;
      *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $SELECT" 20 60 1
  fi
}

do_menu_board() {
  SELECT=$(whiptail --title "Board Selection" --menu "You may use ESC+ESC to cancel." 0 0 0 \
	"1 ek874"        "  EK874 RZ/G2E by Silicon Linux" \
	"2 hihope-rzg2m" "  HiHope RZ/G2M by Hoperun Technology" \
	"3 hihope-rzg2n" "  HiHope RZ/G2N by Hoperun Technology" \
	"4 hihope-rzg2h" "  HiHope RZ/G2H by Hoperun Technology" \
	"5 CUSTOM"       "  (manually edit ini file)" \
	3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 0 ] ; then
    case "$SELECT" in
      1\ *) BOARD=ek874 ; switch_settings ; clear_filenames ; set_filenames ;;
      2\ *) BOARD=hihope-rzg2m ; switch_settings ; clear_filenames ; set_filenames ;;
      3\ *) BOARD=hihope-rzg2n ; switch_settings ; clear_filenames ; set_filenames ;;
      4\ *) BOARD=hihope-rzg2h ; switch_settings ; clear_filenames ; set_filenames ;;
      5\ *) BOARD=CUSTOM ; switch_settings ; clear_filenames ; FLASHWRITER="(please define)" ;;
      *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $SELECT" 20 60 1
  fi
}

do_menu_target_flash() {
  SELECT=$(whiptail --title "Target Flash Selection" --menu "You may use ESC+ESC to cancel." 0 0 0 \
	"1 SPI Flash"  " " \
	"2 eMMC Flash" " " \
	3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 0 ] ; then
    case "$SELECT" in
      1\ *) FLASH=0 ;
        # If building outside of Yocto, and we have the wrong directory selected, we need to update file paths
        echo $SA0_FILE | grep -q z_deploy_emmc ; if [ "$?" == "0" ] ; then clear_filenames ; set_filenames ; fi
        ;;
      2\ *) FLASH=1
        # If building outside of Yocto, and we have the wrong directory selected, we need to update file paths
        echo $SA0_FILE | grep -q z_deploy_spi ; if [ "$?" == "0" ] ; then clear_filenames ; set_filenames ; fi
        ;;
      *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $SELECT" 20 60 1
  fi
}

do_menu_dev() {
  SELECT=$(whiptail --title "Interface Selection" --menu "You may use ESC+ESC to cancel." 0 0 0 \
	"1 /dev/ttyUSB0" "  SCIF Download mode" \
	"2 /dev/ttyACM0" "  USB Download mode" \
	3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 0 ] ; then
    case "$SELECT" in
      1\ *) SERIAL_DEVICE_INTERFACE="/dev/ttyUSB0" ;;
      2\ *) SERIAL_DEVICE_INTERFACE="/dev/ttyACM0" ;;
      *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $SELECT" 20 60 1
  fi
}

do_menu_extra() {
	whiptail --msgbox "Coming soon...." 0 0 0
}

do_menu_file_dir() {

  # Save to check later
  ORIG_FILES_DIR=$FILES_DIR

  SELECT=$(whiptail --title "File Directory Selection" --menu "You may use ESC+ESC to cancel.\n\nHow do you want to select the directory?" 0 0 0 \
	"1 File Browse" "  Use a GUI File broswer " \
	"2 Enter"        "  Manual enter the directory." \
	3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 0 ] ; then
    case "$SELECT" in
      1\ *) 
		which zenity > /dev/null
		if [ "$?" != "0" ] ; then
			whiptail --yesno "ERROR: You need the (small) \"zenity\" dialog box utility installed.\nYou can install by running:\n\n$ sudo apt-get install zenity\n\nRun that command now to install?" 0 0 0
			if [ "$?" == "0" ] ; then
				echo "sudo apt-get install zenity"
				sudo apt-get install zenity
				echo "--------------------------"
				echo " Install complete"
				echo "--------------------------"
				sleep 2
				do_menu_file_dir
			fi
		else
			FILE=`zenity --directory --file-selection --filename=".."  --title="Select your base directory"`
			case $? in
			0)
				FILES_DIR="$FILE"
				;;
			-1)
				whiptail --msgbox "An unexpected error has occurred." 0 0 0
				;;
			esac
		fi
		;;
      2\ *) 
		SELECT=$(whiptail --title "File Direcotry Selection" --inputbox "You may use ESC+ESC to cancel.\n\n Enter the base directory you want to use." 0 100 \
		"$FILES_DIR"  \
		3>&1 1>&2 2>&3)
		RET=$?
		if [ $RET -eq 0 ] ; then

			if [ ! -e "$SELECT" ] ; then
				whiptail --msgbox "Warning: Directory does not exist\n" 0 0 0
			fi
			FILES_DIR="$SELECT"
		fi
		;;
      *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $SELECT" 20 60 1
  fi

  # If we changed the value, then update all the other files
  if [ "$ORIG_FILES_DIR" != "$FILES_DIR" ] ; then
    clear_filenames
    set_filenames
  fi
}

do_menu_file_fw() {
  SELECT=$(whiptail --title "Flash Writer File Selection" --inputbox "You may use ESC+ESC to cancel.\n\n Enter file path to Flash Writer File." 0 100 \
	"AArch64_Flash_writer_SCIF_DUMMY_CERT_E6300400_${BOARD}.mot"  \
	3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 0 ] ; then
   FW_FILE="$SELECT"
  fi
  
}

do_menu_file_sa0() {
  SELECT=$(whiptail --title "SA0 File Selection" --inputbox "You may use ESC+ESC to cancel.\n\n Enter file path to SA0 File." 0 100 \
	"bootparam_sa0.srec"  \
	3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 0 ] ; then
   SA0_FILE="$SELECT"
  fi
}

do_menu_file_bl2() {
  SELECT=$(whiptail --title "BL2 File Selection" --inputbox "You may use ESC+ESC to cancel.\n\n Enter file path to BL2 File." 0 100 \
	"bl2-${BOARD}.srec"  \
	3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 0 ] ; then
   BL2_FILE="$SELECT"
  fi
}

do_menu_file_sa6() {
  SELECT=$(whiptail --title "SA6 File Selection" --inputbox "You may use ESC+ESC to cancel.\n\n Enter file path to SA6 File." 0 100 \
	"cert_header_sa6.srec"  \
	3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 0 ] ; then
   SA6_FILE="$SELECT"
  fi
}

do_menu_file_bl31() {
  SELECT=$(whiptail --title "BL31 File Selection" --inputbox "You may use ESC+ESC to cancel.\n\n Enter file path to BL31 File." 0 100 \
	"bl31-${BOARD}.srec"  \
	3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 0 ] ; then
   BL31_FILE="$SELECT"
  fi
}

do_menu_file_uboot() {
  SELECT=$(whiptail --title "u-boot File Selection" --inputbox "You may use ESC+ESC to cancel.\n\n Enter file path to u-boot File." 0 100 \
	"u-boot-elf-${BOARD}.srec"  \
	3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 0 ] ; then
   UBOOT_FILE="$SELECT"
  fi
}

do_cmd_atf() {
	FW_GUI_MODE=2
	echo "./flash_writer.sh atf"
	./flash_writer.sh atf
	FW_GUI_MODE=1
}

do_cmd_all() {
	FW_GUI_MODE=2
	echo "./flash_writer.sh all"
	./flash_writer.sh all
	FW_GUI_MODE=1
}

do_cmd_sw() {
	#printf '%s\n' "$SW_SETTINGS"
	#read dummy
	whiptail --title "$BOARD_NAME" --msgbox "$SW_SETTINGS" 0 0
}

do_cmd() {
	echo "BOARD=$BOARD FLASH=$FLASH SERIAL_DEVICE_INTERFACE=$SERIAL_DEVICE_INTERFACE ./flash_writer.sh $CMD $FILE_TO_SEND"
	BOARD=$BOARD FLASH=$FLASH SERIAL_DEVICE_INTERFACE=$SERIAL_DEVICE_INTERFACE FW_GUI_MODE=2 ./flash_writer.sh $CMD $FILE_TO_SEND
}

if [ "$FW_GUI_MODE" == "1" ] ; then

  # Set Default Whiptail color (blue looks better than purple)
  export NEWT_COLORS='
  root=,blue
  '

  # Default board file
  CONFIG_FILE=config.ini

  # Change Terminal size (because I like to double-click in the file manager to run this this)
  # Do not do this if you are in a SSH or docker session
  if [ "$DISPLAY" != "" ] ; then
    #printf '\033[8;40;120t'
    resize -s 40 120  > /dev/null
  fi

  # Read what we used last time
  if [ -e "settings.txt" ] ; then
    source settings.txt
    source "$CONFIG_FILE"
  fi

  if [ "$BOARD" == "" ] ; then
    # Some default entries
    BOARD="hihope-rzg2m"
    FILES_DIR=~/yocto/rzg2_bsp_eva_v106/build/tmp/deploy/images/${BOARD}
    SERIAL_DEVICE_INTERFACE="/dev/ttyUSB0"
    FLASH="0"
    CONFIG_FILE="config.ini"
    MUST_RUN_FW_FRIST=1
  fi

  config_hash
  CONFIG_HASH=$CONFIG_HASH_RESULT
  settings_hash
  SETTINGS_HASH=$SETTINGS_HASH_RESULT

  export FW_NOT_DL_YET=1

  while true ; do

    # Set BOARD_NAME and SW_SETTINGS
    switch_settings

    # Set files for Renesas boards
    set_filenames

    # change the text that is displayed on the screen
    FLASH_TEXT=("SPI Flash" "eMMC Flash")
    if [ "${FLASHWRITER:0:6}" != "binaries" ] && [ "${FLASHWRITER:2:8}" != "binaries" ] ; then
      FLASHWRITER_TEXT=$(echo $FLASHWRITER | sed "s:$FILES_DIR:\$FILES_DIR:")
    else
      FLASHWRITER_TEXT=$FLASHWRITER
    fi
    SA0_FILE_TEXT=$(echo $SA0_FILE | sed "s:$FILES_DIR:\$(FILES_DIR):")
    BL2_FILE_TEXT=$(echo $BL2_FILE | sed "s:$FILES_DIR:\$(FILES_DIR):")
    SA6_FILE_TEXT=$(echo $SA6_FILE | sed "s:$FILES_DIR:\$(FILES_DIR):")
    BL31_FILE_TEXT=$(echo $BL31_FILE | sed "s:$FILES_DIR:\$(FILES_DIR):")
    UBOOT_FILE_TEXT=$(echo $UBOOT_FILE | sed "s:$FILES_DIR:\$(FILES_DIR):")

    # check if files exits
    if [ -e "$FILES_DIR" ] ; then FD_EXIST="✓" ; else FD_EXIST="x" ; fi
    if [ -e "$FLASHWRITER" ] ; then FW_EXIST="✓" ; else FW_EXIST="x" ; fi
    if [ -e "$SA0_FILE" ] ; then SA0_EXIST="✓" ; else SA0_EXIST="x" ; fi
    if [ -e "$BL2_FILE" ] ; then BL2_EXIST="✓" ; else BL2_EXIST="x" ; fi
    if [ -e "$SA6_FILE" ] ; then SA6_EXIST="✓" ; else SA6_EXIST="x" ; fi
    if [ -e "$BL31_FILE" ] ; then BL31_EXIST="✓" ; else BL31_EXIST="x" ; fi
    if [ -e "$UBOOT_FILE" ] ; then UBOOT_EXIST="✓" ; else UBOOT_EXIST="x" ; fi

    # Remind users to run flash writer first (FWR =Flash Writer Reminder)
    if [ "$FW_NOT_DL_YET" == "1" ] ; then  FWR="★" ; else FWR=" " ; fi

    # Files directory does not exist, remind user to set(FDR = FILES DIR Reminder)
    if [ ! -e "$FILES_DIR" ] ; then  FDR="★" ; else FDR=" " ; fi

    # check if any settings have changed
    config_hash
    settings_hash
    if [ "$CONFIG_HASH" != "$CONFIG_HASH_RESULT" ] || [ "$SETTINGS_HASH" != "$SETTINGS_HASH_RESULT" ] ; then
      CHANGE_TEXT="\n             !!!! WARNING: Changes not saved yet  !!!!!"
      OK_TEXT="SAVE-and-EXIT"
    else
      CHANGE_TEXT=""
      OK_TEXT="EXIT"
    fi

    if [ "${SERIAL_DEVICE_INTERFACE:8:3}" == "ACM" ] ; then DL_TYPE="USB Download Mode" ; else DL_TYPE="SCIF Download Mode" ; fi

    SELECT=$(whiptail --title "RZ/G2 Flash Writer Configuration" --menu \
	"Select your programming options.\nYou may use [ESC]+[ESC] to Cancel/Exit (no save). Use [Tab] key to select buttons.\n\nUse the <Change> button (or enter) to make changes.\n$CHANGE_TEXT" 0 0 0 --cancel-button $OK_TEXT --ok-button Change \
	--default-item "$LAST_SELECT" \
	"1.             Board:" "  $BOARD_NAME"  \
	"2.      Target Flash:" "  ${FLASH_TEXT[$FLASH]}" \
	"3.         Interface:" "  $SERIAL_DEVICE_INTERFACE  ($DL_TYPE)"  \
	"4.       Config File:" "  $CONFIG_FILE"  \
	"5.    Extra Settings:" "  GUI Colors, special builds, windows size, etc..."  \
	"_______Files_________" "" \
	"10. $FDR      FILES_DIR:" "$FD_EXIST $FILES_DIR" \
	"11.      FLASHWRITER:" "$FW_EXIST $FLASHWRITER_TEXT" \
	"12.         SA0_FILE:" "$SA0_EXIST $SA0_FILE_TEXT" \
	"13.         BL2_FILE:" "$BL2_EXIST $BL2_FILE_TEXT" \
	"14.         SA6_FILE:" "$SA6_EXIST $SA6_FILE_TEXT" \
	"15.        BL31_FILE:" "$BL31_EXIST $BL31_FILE_TEXT" \
	"16.       UBOOT_FILE:" "$UBOOT_EXIST $UBOOT_FILE_TEXT" \
	"______Operations_____" "" \
	"a. $FWR Download F.W.   " "  Downloads the Flash Writer binary (must be run first)" \
	"b.   Program SA0     " "  SA0 (Boot Parameters)" \
	"c.   Program BL2     " "  BL2 (Trusted Boot Firmware)" \
	"d.   Program SA6     " "  SA6 (Cert Header)" \
	"e.   Program BL31    " "  BL31 (EL3 Runtime Software)" \
	"f.   Program u-boot  " "  u-boot (BL33, Non-trusted Firmware)" \
	"g.   Program ATF     " "  Program all arm-trusted-firmware files (SA0,BL2,SA6,BL31)" \
	"h.   Program All     " "  Programs all files (SA0,BL2,SA66,BL31 and u-boot)" \
	"i.   eMMC boot setup " "  Configure an eMMC device for booting (only needed once)" \
	"s. $FWR Show switches   " "  Show the switch settings for Renesas boards (in case you forgot)" \
	3>&1 1>&2 2>&3)
    RET=$?
    if [ $RET -eq 1 ] ; then
      # save if changes
      config_hash
      if [ "$CONFIG_HASH" != "$CONFIG_HASH_RESULT" ] || [ ! -e "$CONFIG_FILE" ] ; then
        echo "# This file was created by the flash_writer.sh" > $CONFIG_FILE
        echo "BOARD=$BOARD" >> $CONFIG_FILE
        echo "FLASH=$FLASH" >> $CONFIG_FILE
        echo "SERIAL_DEVICE_INTERFACE=$SERIAL_DEVICE_INTERFACE" >> $CONFIG_FILE

        echo "FILES_DIR=$FILES_DIR" >> $CONFIG_FILE
        echo "FLASHWRITER=$FLASHWRITER" >> $CONFIG_FILE
        echo "SA0_FILE=$SA0_FILE" >> $CONFIG_FILE
        echo "BL2_FILE=$BL2_FILE" >> $CONFIG_FILE
        echo "SA6_FILE=$SA6_FILE" >> $CONFIG_FILE
        echo "BL31_FILE=$BL31_FILE" >> $CONFIG_FILE
        echo "UBOOT_FILE=$UBOOT_FILE" >> $CONFIG_FILE
      fi

      # Global Settings
      settings_hash
      if [ "$SETTINGS_HASH" != "$SETTINGS_HASH_RESULT" ]  || [ ! -e settings.txt ] ; then
        echo "CONFIG_FILE=$CONFIG_FILE" > settings.txt
        echo -e "\n# Whiptail colors\nexport NEWT_COLORS='""$NEWT_COLORS""'" >> settings.txt
      fi

      break;
    elif [ $RET -eq 0 ] ; then
      LAST_SELECT="$SELECT"
      case "$SELECT" in
        1.\ *) do_menu_board ;;
        2.\ *) do_menu_target_flash ;;
        3.\ *) do_menu_dev ;;
        4.\ *) do_menu_config ;;
        5.\ *) do_menu_extra ;;
        10.\ *) do_menu_file_dir ;;
        11.\ *) do_menu_file_fw ;;
        12.\ *) do_menu_file_sa0 ;;
        13.\ *) do_menu_file_bl2 ;;
        14.\ *) do_menu_file_sa6 ;;
        15.\ *) do_menu_file_bl31 ;;
        16.\ *) do_menu_file_uboot ;;
        a.\ *) whiptail --title "Download mode" --msgbox "Make sure the board is configured for \"SCIF Download mode\" or \"USB Download mode\"\n\nPower on the board and press the RESET button.\n\nThen, press ENTER on the keyboard to continue." 0 0 ;
		CMD=fw FILE_TO_SEND=$FLASHWRITER ; do_cmd ; export FW_NOT_DL_YET=0 ;;
        b.\ *) check_fw_first ; if [ "$CMD_ABORT" != "1" ] ; then CMD=sa0 ; FILE_TO_SEND=$SA0_FILE ; do_cmd ; fi ;;
        c.\ *) check_fw_first ; if [ "$CMD_ABORT" != "1" ] ; then CMD=bl2 ; FILE_TO_SEND=$BL2_FILE ; do_cmd ; fi ;;
        d.\ *) check_fw_first ; if [ "$CMD_ABORT" != "1" ] ; then CMD=sa6 ; FILE_TO_SEND=$SA6_FILE ; do_cmd ; fi ;;
        e.\ *) check_fw_first ; if [ "$CMD_ABORT" != "1" ] ; then CMD=bl31 ; FILE_TO_SEND=$BL31_FILE ; do_cmd ; fi ;;
        f.\ *) check_fw_first ; if [ "$CMD_ABORT" != "1" ] ; then CMD=uboot ; FILE_TO_SEND=$UBOOT_FILE ; do_cmd ; fi ;;
        g.\ *) check_fw_first ; if [ "$CMD_ABORT" != "1" ] ; then
		CMD=sa0 ; FILE_TO_SEND=$SA0_FILE ; do_cmd ; sleep 1 ;
		CMD=bl2 ; FILE_TO_SEND=$BL2_FILE ; do_cmd ; sleep 2 ;
		CMD=sa6 ; FILE_TO_SEND=$SA6_FILE ; do_cmd ;  sleep 1 ;
		CMD=bl31 ; FILE_TO_SEND=$BL31_FILE ; do_cmd ;  sleep 2 ;
		fi ;;
        h.\ *) check_fw_first ; if [ "$CMD_ABORT" != "1" ] ; then
		CMD=sa0 ; FILE_TO_SEND=$SA0_FILE ; do_cmd ;  sleep 1 ;
		CMD=bl2 ; FILE_TO_SEND=$BL2_FILE ; do_cmd ;  sleep 2 ;
		CMD=sa6 ; FILE_TO_SEND=$SA6_FILE ; do_cmd ;  sleep 1 ;
		CMD=bl31 ; FILE_TO_SEND=$BL31_FILE ; do_cmd ;  sleep 2 ;
		CMD=uboot ; FILE_TO_SEND=$UBOOT_FILE ; do_cmd ;  sleep 2 ;
		fi ;;
        i.\ *) CMD=emmc_config ; FILE_TO_SEND= ; do_cmd ;;
        s.\ *) do_cmd_sw ;;
        *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
      esac || whiptail --msgbox "There was an error running option $SELECT" 20 60 1
    else
      exit 1
    fi
  done
  exit
fi

# do_xls2
# $1 = string
# $2 = RAM address to download to
# $3 = SPI address to write to
# $4 = filename
do_xls2() {
	# Flash writer just looks for CR. If it see LF, it ignores it.
	echo "Writting $1 ($4)"
	echo "Sending XLS2 command..."
	echo -en "XLS2\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo -en "$2\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo -en "$3\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo "Sending file..."
	#cat $4 > $SERIAL_DEVICE_INTERFACE
	stat -L --printf="%s bytes\n" $4
	dd if=$4 of=$SERIAL_DEVICE_INTERFACE bs=1k status=progress
	sleep 0.5

	# You only need to send a 'y', not the 'y' + CR. But, if the flash is already
	# blank, flash writer will not ask you to confirm, so we send y + CR
	# just in case. So if the flash is already blank you will just see an
	# extra 'command not found' message which does not hurt anything.
	echo -en "y\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo ""
}

# do_xls3
# $1 = string
# $2 = SPI address to write to
# $3 = filename
do_xls3() {
	# Flash writer just looks for CR. It ignores LF characters.
	echo "Writting $1 ($3)"
	echo "Sending XLS3 command..."
	echo -en "XLS3\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5

	# get the file size of our binary
	SIZE_DEC=$(stat -L --printf="%s" $3)
	SIZE_HEX=$(printf '%X' $SIZE_DEC)
	echo -en "$SIZE_HEX\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5

	echo -en "$2\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5

	echo "Sending file..."
	#cat $3 > $SERIAL_DEVICE_INTERFACE
	stat -L --printf="%s bytes\n" $3
	dd if=$3 of=$SERIAL_DEVICE_INTERFACE bs=1k status=progress
	sleep 0.5

	# You only need to send a 'y', not the 'y' + CR. But, if the flash is already
	# blank, flash writer will not ask you to confirm, so we send y + CR
	# just in case. So if the flash is already blank you will just see an
	# extra 'command not found' message which does not hurt anything.
	echo -en "y\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo ""
}

# do_em_w
# $1 = string
# $2 = partition number
# $3 = eMMC block address to write to
# $4 = RAM address to download to
# $5 = filename
do_em_w() {
	# Flash writer just looks for CR. It ignores LF characters.
	echo "Writting $1 ($5)"
	echo "Sending EM_W command..."
	echo -en "EM_W\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo -en "$2\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo -en "$3\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo -en "$4\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo "Sending file..."
	#cat $5 > $SERIAL_DEVICE_INTERFACE
	stat -L --printf="%s bytes\n" $5
	dd if=$5 of=$SERIAL_DEVICE_INTERFACE bs=1k status=progress
	sleep 0.5
	echo ""
}

# do_em_wb
# $1 = string
# $2 = partition number
# $3 = eMMC block address to write to
# $4 = filename
do_em_wb() {
	# Flash writer just looks for CR. It ignores LF characters.
	echo "Writting $1 ($4)"
	echo "Sending EM_WB command..."
	echo -en "EM_WB\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo -en "$2\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo -en "$3\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5

	# get the file size of our binary
	SIZE_DEC=$(stat -L --printf="%s" $4)
	SIZE_HEX=$(printf '%X' $SIZE_DEC)
	echo -en "$SIZE_HEX\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5

	echo "Sending file..."
	#cat $4 > $SERIAL_DEVICE_INTERFACE
	stat -L --printf="%s bytes\n" $4
	dd if=$4 of=$SERIAL_DEVICE_INTERFACE bs=1k status=progress
	sleep 0.5
	echo ""
}

# do_spi_write
# $1 = string
# $2 = RAM address to download to
# $3 = SPI address to write to
# $4 = filename
do_spi_write() {

	# Send a CR (\r) just to make sure there are not extra characters left over from the last transfer
	#echo -en "\r" > $SERIAL_DEVICE_INTERFACE

	# Check if file is SREC or bin
	FILENAME=$(basename $4)
	FILENAME_EXT=`echo ${FILENAME: -5}`
	if [ "$FILENAME_EXT" == ".srec" ] ; then
		# S-Record Write
		do_xls2 "$1" $2 $3 $4
	else
		# Binary Write (RAM address not needed)
		do_xls3 "$1" $3 $4
	fi
}

# do_emmc_write
# $1 = string
# $2 = partition number
# $3 = eMMC starting block to write
# $4 = RAM address to download to
# $5 = filename
do_emmc_write() {
	# Send a CR (\r) just to make sure there are not extra characters left over from the last transfer
	#echo -en "\r" > $SERIAL_DEVICE_INTERFACE

	# Check if file is SREC or bin
	FILENAME=$(basename $5)
	FILENAME_EXT=`echo ${FILENAME: -5}`
	if [ "$FILENAME_EXT" == ".srec" ] ; then
		# S-Record Write
		do_em_w "$1" $2 $3 $4 $5
	else
		# Binary Write
		do_em_wb "$1" $2 $3 $5
	fi
}

print_usage() {
	echo "Usage: [config file] [operation] [file name]" \
	"config file"
	echo "config file"
	echo "$0 fw               # Downloads the flash writer program after RESET (must be run first)"
	echo ""
	echo "$0 sa0              # programs SA0 (Boot Parameters)"
	echo "$0 bl2              # programs BL2 (Trusted Boot Firmware)"
	echo "$0 sa6              # programs SA6 (Cert Header)"
	echo "$0 bl31             # programs BL31 (EL3 Runtime Software)"
	echo "$0 uboot            # programs u-boot (BL33, Non-trusted Firmware)"
	echo "$0 atf              # programs sa0,bl2,sa6,bl31 all at once"
	echo "$0 all              # programs sa0,bl2,sa6,bl31,uboot all at once"
	echo ""
	echo "$0 emmc_config      # Configure an eMMC for booting (only needed once)"
	echo ""
	echo "$0 sw               # Show the switch settings for Renesas boards (in case you forgot)"
	echo ""
	echo "$0 h                # Show this help menu"
	echo ""
	echo "   Note: You can also pass a filename on the command line."
	echo "         Example: $ $0 sa0 ../../arm-trusted-firmware/tools/dummy_create/bootparam_sa0.srec"
}

# If the first argument is a filename, assume it is the config file.
if [ -e "$1" ] ; then
  # Read in our settings
  source $1

  # The 2nd argument  is the command
  CMD=$2
else
  # The 1st argument  is the command
  CMD=$1

  # If BOARD is not already set, assume config.ini as default
  if [ "$BOARD" == "" ] && [ -e "config.ini" ] ; then
    source config.ini
  else
    if [ "$FW_GUI_MODE" != "2" ] ; then
      echo "ERROR: Default file \"config.ini\" does not exit."
      echo "       Please make a copy the example_config.ini file"
      echo "         $ cp  example_config.ini  config.ini"
      echo ""
      echo "       or pass a config filename on the command line as the first argument"
      echo "         $ cp  my_config.ini help"
      echo "       "
      echo "       Please see Readme.md."
    fi
  fi
fi

# Usage is displayed when no arguments on command line
if [ "$CMD" == "h" ] ; then
	print_usage
	exit
fi

if [ "$BOARD" == "" ] ; then
  echo "ERROR: Board not selected in config.ini"
  echo "Please edit config.ini in a text editor before continuing"
  exit
fi


# Set BOARD_NAME and SW_SETTINGS
switch_settings

# 0 = SPI Flash
# 1 = eMMC
if [ "$FLASH" == "" ] ; then
	echo "ERROR: FLASH not selected in config.ini"
	echo "Please edit config.ini in a text editor before continuing"
	exit
fi

# Set default tty interface if not set
if [ "$SERIAL_DEVICE_INTERFACE" == "" ] ; then
	SERIAL_DEVICE_INTERFACE=/dev/ttyUSB0
	#SERIAL_DEVICE_INTERFACE=/dev/ttyACM0
fi

# Turn off some conversions that disrupt sending binary files over tty connections.
# These are already the defaults for /dev/ttyUSB0, so this requirement is really only for
# when using /dev/ttyACM0
stty -icrnl -onlcr -isig -icanon -echoe -opost -F $SERIAL_DEVICE_INTERFACE


# Print current selected board
if [ "$FLASH" == "0" ] ; then
	FLASH_TEXT="SPI Flash"	# 0 = SPI Flash
else
	FLASH_TEXT="eMMC Flash"	# 1 = eMMC
fi

echo "----------------------------------------------------"
echo "   Board: $BOARD_NAME"
echo "  Target: $FLASH_TEXT"
echo "----------------------------------------------------"

if [ "$CMD" == "fw" ] ; then

	if [ "$2" != "" ] ; then
		FLASHWRITER=$2
	fi

	if [ "$FW_GUI_MODE" != "2" ] ; then
		echo "-----------------------------------------------------------------"
		echo " Make sure the board is configured for \"SCIF Download mode"\"
		echo " Power on the board and press the RESET button."
		echo " Then, press ENTER on the keyboard to continue."
		echo "-----------------------------------------------------------------"
		read dummy
	fi
	echo "Sending Flash Writter Binary ($FLASHWRITER)"
	stat -L --printf="%s bytes\n" $FLASHWRITER
	#cat $FLASHWRITER > $SERIAL_DEVICE_INTERFACE
	dd if=$FLASHWRITER of=$SERIAL_DEVICE_INTERFACE bs=1k status=progress
	sleep 0.5
	# Clear out the extra left over characters
	echo -en "\r" > $SERIAL_DEVICE_INTERFACE
	echo "Complete"
	exit
fi

if [ "$CMD" == "sw" ] ; then
	switch_settings
	printf '%s\n' "$SW_SETTINGS"
	exit
fi

if [ "$CMD" == "emmc_config" ] ; then

	# Set the EXT_CSD register 177 (0xB1) BOOT_BUS_CONDITIONS:
	#  * BOOT_MODE bit[4:3] = 0x1 (Use single data rate + High Speed timings in boot operation mode)(50MHz SDR)
	#  * BOOT_BUS_WIDTH bit[1:0] = 0x2 (x8 bus width in boot operation mode)
	echo "Setting EXT_CSD regiser 177..."
	echo -en "EM_SECSD\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo -en "b1\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo -en "0a\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5

	# Set the EXT_CSD register 179 (0xB3) PARTITION_CONFIG:
	#   * BOOT_ACK bit[6] = 0x0 (No boot acknowledge sent)
	#   * BOOT_PARTITION_ENABLE bit[5:3] = 0x1 (Boot partition 1 enabled for boot)
	echo "Setting EXT_CSD regiser 179..."
	echo -en "EM_SECSD\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo -en "b3\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
	echo -en "08\r" > $SERIAL_DEVICE_INTERFACE
	sleep 0.5
fi


if [ "$CMD" == "sa0" ] || [ "$CMD" == "atf" ] || [ "$CMD" == "all" ]; then
	if [ "$2" != "" ] ; then
		SA0_FILE=$2
	fi

	if [ "$FLASH" == "0" ] ; then
		do_spi_write "bootparam SA0" E6320000 000000 $SA0_FILE
	else
		do_emmc_write "bootparam SA0" 1 000000 E6320000 $SA0_FILE
	fi

	if [ "$CMD" == "atf" ] || [ "$CMD" == "all" ] ; then
		# We need extra time before starting the next operation
		sleep 1
	fi
fi

if [ "$CMD" == "bl2" ] || [ "$CMD" == "atf" ] || [ "$CMD" == "all" ] ; then
	if [ "$2" != "" ] ; then
		BL2_FILE=$2
	fi
	if [ "$FLASH" == "0" ] ; then
		do_spi_write "BL2" E6304000 040000 $BL2_FILE
	else
		do_emmc_write "BL2" 1 00001E E6304000 $BL2_FILE
	fi

	if [ "$CMD" == "atf" ] || [ "$CMD" == "all" ] ; then
		# We need extra time before starting the next operation
		sleep 3
	fi
fi

if [ "$CMD" == "sa6" ] || [ "$CMD" == "atf" ] || [ "$CMD" == "all" ] ; then
	if [ "$2" != "" ] ; then
		SA6_FILE=$2
	fi
	if [ "$FLASH" == "0" ] ; then
		do_spi_write "Cert Header SA6" E6320000 180000 $SA6_FILE
	else
		do_emmc_write "Cert Header SA6" 1 000180 E6320000 $SA6_FILE
	fi

	if [ "$CMD" == "atf" ] || [ "$CMD" == "all" ] ; then
		# We need extra time before starting the next operation
		sleep 1
	fi
fi

if [ "$CMD" == "bl31" ] || [ "$CMD" == "atf" ] || [ "$CMD" == "all" ] ; then
	if [ "$2" != "" ] ; then
		BL31_FILE=$2
	fi
	if [ "$FLASH" == "0" ] ; then
		do_spi_write "BL31" 44000000 1C0000 $BL31_FILE
	else
		do_emmc_write "BL31" 1 000200 44000000 $BL31_FILE
	fi

	if [ "$CMD" == "atf" ] || [ "$CMD" == "all" ] ; then
		# We need extra time before starting the next operation
		sleep 3
	fi
fi

if [ "$CMD" == "uboot" ] || [ "$CMD" == "all" ] ; then
	if [ "$2" != "" ] ; then
		UBOOT_FILE=$2
	fi
	if [ "$FLASH" == "0" ] ; then
		do_spi_write "u-boot" 50000000 300000 $UBOOT_FILE
	else
		do_emmc_write "u-boot" 2 000000 50000000 $UBOOT_FILE
	fi

	if [ "$CMD" == "all" ] ; then
		# We need extra time before starting the next operation
		sleep 3
	fi
fi


