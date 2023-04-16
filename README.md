# autoadb

Automate common place annoying tasks having to do with ADB

This script automates common tasks with the Android Debug Bridge (ADB) tool. Here are the features included in the script:

shut_off_phone: This function shuts off the phone using the adb shell poweroff command.

reboot_into_recovery: This function reboots the phone into recovery mode using the adb reboot recovery command.

reboot_into_download: This function reboots the phone into download mode using the adb reboot download command.

install_apk <path to apk>: This function installs an APK file onto the phone using the adb install command.

remove_apk <package name>: This function removes an APK from the phone using the adb uninstall command.

view_logcat: This function displays the logcat output from the phone using the adb logcat command.

reboot_into_os: This function reboots the phone into the operating system using the adb reboot command.

edit_file_with_vim <path to file>: This function downloads a file from the phone using the adb pull command, opens it in vim, allows the user to edit it, and then pushes the edited file back to the phone using the adb push command.

The script also includes a check_adb_installed function, which checks if ADB is installed on the system and installs it using the android-tools-adb and android-tools-fastboot packages if it's not installed. This ensures that the ADB tools are available before running any of the functions in the script.

This script checks if adb is installed using command -v adb, and if it's not found, it installs android-tools-adb and android-tools-fastboot using sudo apt install android-tools-adb android-tools-fastboot. This assumes that the script is running on a Debian-based distribution, so you might need to modify the installation command if you're using a different Linux distribution.
