#!/bin/bash
# $1: dir for lewa
# $2: dir for original

APKTOOL="$PORT_ROOT/tools/apktool --quiet"
BUILD_OUT=out

SEP_FRAME="framework_ext.jar.out"

if [ $2 = "$BUILD_OUT/framework" ]
then
    # remove all files at out/framework those exist in framework_ext.jar.out

    rm -rf "$BUILD_OUT/framework/smali/android/filterfw"
    rm -rf "$BUILD_OUT/framework/smali/android/filterpacks"
    rm -rf "$BUILD_OUT/framework/smali/android/gesture"
fi
