#!/bin/bash

base="https://dl.google.com/android/repository"
file="commandlinetools-linux-8092744_latest.zip"


# install java, JAVA_HOME must be set

cd ~/Downloads && wget "$base/$file"
unzip "$file"
cd cmdline-tools

# Android SDK Command-Line Tools
# Located in: android_sdk/cmdline-tools/version/bin/

# apkanalyzer: Provides insight into the composition of your APK after the build process completes.
# avdmanager:  Allows you to create and manage Android Virtual Devices (AVDs) from the command line.
# lint:        A code scanning tool that can help you to identify and correct problems with the structural quality of your code.
# retrace:     For applications compiled by R8, retrace decodes an obfuscated stack trace that maps back to your original source code.
# sdkmanager:  Allows you to view, install, update, and uninstall packages for the Android SDK.

# aapt2:     Parses, indexes, and compiles Android resources into a binary format that is optimized for the Android platform, and packages the compiled resources into a single output.
# apksigner: Signs APKs and checks whether APK signatures will be verified successfully on all platform versions that a given APK supports.
# zipalign:  Optimizes APK files by ensuring that all uncompressed data starts with a particular alignment relative to the start of the file.

# Note: You can have multiple versions of the build tools to build your app for different Android versions.

# Android SDK Platform Tools
# Located in: android_sdk/platform-tools/

# These tools are updated for every new version of the Android platform to support new features (and sometimes more often to fix or improve the tools), and each update is backward compatible with older platform versions.
# In addition to downloading from the SDK Manager, you can download the SDK Platform Tools here.

# adb:      Android Debug Bridge (adb) is a versatile tool that lets you manage the state of an emulator instance or Android-powered device. You can also use it to install an APK on a device.
# etc1tool: A command line utility that lets you encode PNG images to the ETC1 compression standard and decode ETC1 compressed images back to PNG.
# fastboot: Flashes a device with platform and other system images. For flashing instructions, see Factory Images for Nexus and Pixel Devices.
# logcat:   This is a tool invoked via adb to view app and system logs.

# Android Emulator
# Located in: android_sdk/emulator/

# This package is required to use the Android Emulator. It includes the following:.

# emulator: A QEMU-based device-emulation tool that you can use to debug and test your applications in an actual Android run-time environment.
# mksdcard: Helps you create a disk image that you can use with the emulator, to simulate the presence of an external storage card (such as an SD card).
