#!/bin/bash
# thanks to lkxyyjx
# sudo ant -Dplatforms.JDK_1.7.home=/opt/jdk1.7.0_80 compile
# sudo ant -Dplatforms.JDK_1.7.home=/opt/jdk1.7.0_80 jar
mkdir -p dist
find src -name "*.java" > sources.txt
javac -d dist -cp "cores/*" @sources.txt