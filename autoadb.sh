#!/bin/bash

# function to check if ADB is installed and install it if it's not
check_adb_installed() {
  if ! command -v adb &> /dev/null
  then
      echo "ADB is not installed. Installing it now..."
      sudo apt update
      sudo apt install android-tools-adb android-tools-fastboot
  fi
}

# function to shut off phone
shut_off_phone() {
  check_adb_installed
  adb shell poweroff
}

# function to reboot into recovery
reboot_into_recovery() {
  check_adb_installed
  adb reboot recovery
}

# function to reboot into download mode
reboot_into_download() {
  check_adb_installed
  adb reboot download
}

# function to install an apk
install_apk() {
  check_adb_installed
  if [ -z "$1" ]
  then
      echo "Usage: install_apk <path to apk>"
      return
  fi
  adb install "$1"
}

# function to remove an apk
remove_apk() {
  check_adb_installed
  if [ -z "$1" ]
  then
      echo "Usage: remove_apk <package name>"
      return
  fi
  adb uninstall "$1"
}

# function to view logcat
view_logcat() {
  check_adb_installed
  adb logcat
}

# function to reboot into operating system
reboot_into_os() {
  check_adb_installed
  adb reboot
}

# function to edit a file with vim
edit_file_with_vim() {
  check_adb_installed
  if [ -z "$1" ]
  then
      echo "Usage: edit_file_with_vim <path to file>"
      return
  fi
  adb pull "$1" .
  vim "$1"
  adb push "$1" .
}

# main function
main() {
  case "$1" in
      shut_off_phone)
          shut_off_phone
          ;;
      reboot_into_recovery)
          reboot_into_recovery
          ;;
      reboot_into_download)
          reboot_into_download
          ;;
      install_apk)
          install_apk "$2"
          ;;
      remove_apk)
          remove_apk "$2"
          ;;
      view_logcat)
          view_logcat
          ;;
      reboot_into_os)
          reboot_into_os
          ;;
      edit_file_with_vim)
          edit_file_with_vim "$2"
          ;;
      *)
          echo "Usage: $0 {shut_off_phone|reboot_into_recovery|reboot_into_download|install_apk <path to apk>|remove_apk <package name>|view_logcat|reboot_into_os|edit_file_with_vim <path to file>}"
          ;;
  esac
}

# run main function with arguments passed to the script
main "$@"
