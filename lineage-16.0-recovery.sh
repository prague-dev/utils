#!/usr/bin/env bash

#
# LineageOS 16.0 recovery build script, to be run after full rom compiling
#

ORG_URL="https://github.com/prague-dev"
MANIFEST_URL="git://github.com/LineageOS/android.git"
BRANCH="16.0-recovery"

rm -rf device/huawei/prague
rm -rf device/huawei/hi6250-common
git clone $ORG_URL/android_device_huawei_prague -b $BRANCH device/huawei/prague
git clone $ORG_URL/android_device_huawei_hi6250-common -b $BRANCH device/huawei/hi6250-common

. build/envsetup.sh
lunch lineage_prague-userdebug
mka recoveryimage -j32
