#!/bin/bash
export TMPDIR=./ffmpeg_tmp
NDK=/home/luo/android-ndk-r14b
SYSROOT=$NDK/platforms/android-18/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
function build_one { 
    ./configure \
     --prefix=$PREFIX \
     --enable-hwaccel=h264_vaapi \
     --enable-hwaccel=h264_vaapi \
     --enable-hwaccel=h264_dxva2 \
     --enable-hwaccel=mpeg4_vaapi \
     --enable-hwaccels \
     --enable-shared \
     --disable-static \
     --disable-doc \
     --disable-ffmpeg \
     --disable-ffplay \
     --disable-ffprobe \
     --disable-avdevice \
     --disable-doc \
     --disable-symver \
     --enable-jni \
     --enable-mediacodec \
     --enable-decoder=h264_mediacodec \
     --enable-hwaccel=h264_mediacodec \
     --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
     --target-os=android \
     --arch=arm \
     --enable-cross-compile \
     --sysroot=$SYSROOT \
     --extra-cflags="-Os -fpic $ADDI_CFLAGS" \
     --extra-ldflags="$ADDI_LDFLAGS" \
     $ADDITIONAL_CONFIGURE_FLAG
     make clean
     make
     make install
 }
 CPU=arm
 PREFIX=$(pwd)/android/$CPU
 ADDI_CFLAGS="-marm"
 build_one
