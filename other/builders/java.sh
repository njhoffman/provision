#!/bin/bash

# Installing OpenJDK JRE
# With new versions of Java released every 6 months, there are multiple versions available for use. Nowadays, Java 11 is the current Long Term Support (LTS) version, but Java 8 is still widely used. Moreover, the non LTS versions of Java are bringing a steady stream of innovation into the language, and also see some adoption.
# Ubuntu offers the default-jre package, which is regularly updated to ship the latest version of the current OpenJDK JRE in Long Term Support (LTS). The default-jre is an excellent choice for most situations, thanks to the outstanding track of backwards compatibility of the Java Virtual Machine.
# (Alternatively, you may opt to use a specific Java version, using for example the openjdk-11-jre package; as updates are released for that version of the Java Virtual Machine, that packages will be updated, allowing you to stick to the latest and greatest update of one specific version of the Java language.)

sudo apt install default-jre
java -version

# JDK is a software development kit whereas JRE is a software bundle that allows Java program to run, whereas JVM is an environment for executing bytecode. The full form of JDK is Java Development Kit, while the full form of JRE is Java Runtime Environment, while the full form of JVM is Java Virtual Machine.

# sudo apt-get install openjdk-11-jdk
sudo apt install default-jdk
javac --version
