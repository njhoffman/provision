#!/bin/bash

# install java, JAVA_HOME must be set

# Command line tools: https://developer.android.com/studio
base="https://dl.google.com/android/repository"
file="commandlinetools-linux-9477386_latest.zip"
cd ~/Downloads && wget "$base/$file"
unzip "$file" && mv cmdline-tools ~/.local/lib/android_sdk
cd "$HOME/.local/lib/android_sdk/bin/" || return
for file in *; do
  ln -s "$HOME/.local/lib/android_sdk/bin/$file" "$HOME"/.local/bin/"$file"
done

sdkmanager --sdk_root="$HOME/.local/lib/android_sdk" --install \
  "cmdline-tools;latest" \
  "platform-tools" \
  "build-tools;34.0.0" \
  "emulator"

## Main environment variables ##
# ANDROID_HOME	Sets the path to the SDK installation directory. Once set, the value does not typically change and can be shared by multiple users on the same machine. ANDROID_SDK_ROOT, which also points to the SDK installation directory, is deprecated. If you continue to use it, Android Studio and the Android Gradle plugin will check that the old and new variables are consistent.
# ANDROID_USER_HOME	Sets the path to the user preferences directory for tools that are part of the Android SDK. Defaults to $HOME/.android/.
# REPO_OS_OVERRIDE	Set this variable to windows, macosx, or linux when you use sdkmanager to download packages for an operating system different from the current machine.

## Android SDK Command-Line Tools ##
#  - Located in: android_sdk/cmdline-tools/version/bin/
# apkanalyzer: Provides insight into the composition of your APK after the build process completes.
# avdmanager:  Allows you to create and manage Android Virtual Devices (AVDs) from the command line.
# lint:        A code scanning tool that can help you to identify and correct problems with the structural quality of your code.
# retrace:     For applications compiled by R8, retrace decodes an obfuscated stack trace that maps back to your original source code.
# sdkmanager:  Allows you to view, install, update, and uninstall packages for the Android SDK.

## Android SDK Build Tools ##
# aapt2:     Parses, indexes, and compiles Android resources into a binary format that is optimized for the Android platform, and packages the compiled resources into a single output.
# apksigner: Signs APKs and checks whether APK signatures will be verified successfully on all platform versions that a given APK supports.
# zipalign:  Optimizes APK files by ensuring that all uncompressed data starts with a particular alignment relative to the start of the file.
#   - Note: You can have multiple versions of the build tools to build your app for different Android versions.

## Android SDK Platform Tools ##
# adb:      Android Debug Bridge (adb) is a versatile tool that lets you manage the state of an emulator instance or Android-powered device. You can also use it to install an APK on a device.
# etc1tool: A command line utility that lets you encode PNG images to the ETC1 compression standard and decode ETC1 compressed images back to PNG.
# fastboot: Flashes a device with platform and other system images. For flashing instructions, see Factory Images for Nexus and Pixel Devices.
# logcat:   This is a tool invoked via adb to view app and system logs.
#   - Located in: android_sdk/platform-tools/
#   - These tools are updated for every new version of the Android platform to support new features (and sometimes more often to fix or improve the tools), and each update is backward compatible with older platform versions.
#   - In addition to downloading from the SDK Manager, you can download the SDK Platform Tools here.

## Android Emulator ##
# emulator: A QEMU-based device-emulation tool that you can use to debug and test your applications in an actual Android run-time environment.
# mksdcard: Helps you create a disk image that you can use with the emulator, to simulate the presence of an external storage card (such as an SD card).
#   - Located in: android_sdk/emulator/
#   - This package is required to use the Android Emulator. It includes the following:.
#   - By default, the emulator stores configuration files under $HOME/.android/ and AVD data under $HOME/.android/avd/. You can override the defaults by setting the following environment variables. The emulator -avd <avd_name> command searches the avd directory in the order of the values in $ANDROID_AVD_HOME, $ANDROID_USER_HOME/avd/, and $HOME/.android/avd/.
#   - For emulator environment variable help, type emulator -help-environment at the command line. For information about emulator command-line options, see Start the emulator from the command line.
#   ANDROID_EMULATOR_HOME	Sets the path to the user-specific emulator configuration directory. Defaults to $ANDROID_USER_HOME.
#   ANDROID_AVD_HOME	Sets the path to the directory that contains all AVD-specific files, which mostly consist of very large disk images. The default location is $ANDROID_EMULATOR_HOME/avd/. You might want to specify a new location if the default location is low on disk space.
#   ANDROID_LOG_TAGS	See ANDROID_LOG_TAGS.
#   ANDROID_VERBOSE	See ANDROID_VERBOSE.
#   ANDROID_HOME	See ANDROID_HOME.
#   ANDROID_EMULATOR_USE_SYSTEM_LIBS	Contains a value of 0 (default) or 1. A value of 1 means the system's libstdc++.so file is used instead of the one that comes bundled with the emulator. Set this environment variable only when the emulator does not start on your Linux system because of a system library problem. For example, some Linux Radeon GL driver libraries require a more recent libstdc++.so file.
#   HTTP_PROXY	Contains the HTTP/HTTPS proxy setting for a global HTTP proxy. Uses a colon (:) separator between the host and the port. For example, set HTTP_PROXY=myserver:1981. This is the same as specifying the -http-proxy proxy argument when running the emulator from the command line.
#   - Note: There is no guarantee that setting this environment variable to 1 will make the emulator runnable. It is a work-around for system library issues that affect a very small number of Linux users.

## Quick emulator (QEMU) audio ##
# QEMU_AUDIO_DRV QEMU_AUDIO_OUT_DRV QEMU_AUDIO_IN_DRV
# - On Linux, you can change the default audio backend of the emulator by setting the QEMU_AUDIO_DRV environment variable to one of the following values:
# - alsa: Use the Advanced Linux Sound Architecture (ALSA) backend
# - esd: Use the Enlightened Sound Daemon (EsounD) backend
# - sdl: Use the Simple DirectMedia Layer (SDL) audio backend (no audio input supported)
# - oss:: Use the Open Sound System (OSS) backend
# - none:: Do not support audio
# set QEMU_AUDIO_DRV=alsa
# - You can also use distinct backends for audio input and audio outputs by selecting one of the QEMU values for the QEMU_AUDIO_OUT_DRV and QEMU_AUDIO_IN_DRV environment variables:
# set QEMU_AUDIO_OUT=esd
# set QEMU_AUDIO_IN=oss
# - If you want to disable the audio support, use the emulator -no-audio option or set QEMU_AUDIO_DRV to none. You might need to disable the audio in the following situations:
# - In rare cases, audio drivers can cause Windows to reboot while the emulator is running.
# - On some Linux machines, the emulator might get stuck at startup with audio support enabled.

## adb Environment Variables ##
# ANDROID_SERIAL	Use this variable to provide an emulator serial number, such as emulator-5555, to an adb command. If you set this variable but use the -s option to specify a serial number from the command line, the command-line input overrides the value in ANDROID_SERIAL.
# - The following example sets ANDROID_SERIAL and calls adb install helloworld.apk, which then installs the Android application package on emulator-5555.
# set ANDROID_SERIAL=emulator-555
# adb install helloWorld.apk
# adb logcat environment variables
# ANDROID_LOG_TAGS	Use this environment variable to set a default filter expression when you are running logcat from your development computer. For example:
# set ANDROID_LOG_TAGS=ActivityManager:I MyApp:D *:.
# - This is the same as specifying the -logcat tags argument when running the emulator from the command line.
# ADB_TRACE	Contains a comma-separated list of the debug information to log. Values can be the following: all, adb, sockets, packets, rwx, usb, sync, sysdeps, transport, and jdwp.
# - To display the adb logs for the adb clients and the adb server, set ADB_TRACE to all and then call the adb logcat command, as follows:
# set ADB_TRACE=all
# adb logcat
# ANDROID_VERBOSE	Contains a comma-separated list of verbose output options (debug tags) used by the emulator. The following example shows ANDROID_VERBOSE defined with the debug-socket and debug-radio debug tags:
# set ANDROID_VERBOSE=socket,radio
# - This is the same as specifying the -verbose -verbose-socket -verbose-radio arguments together when running the emulator from the command line.
# - Unsupported debug tags are ignored. For more information about debug tags, use emulator -help-debug-tags.
