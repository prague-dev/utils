#!/usr/bin/env bash

#
# LineageOS 16.0 build script
#

ORG_URL="https://github.com/prague-dev"
MANIFEST_URL="git://github.com/LineageOS/android.git"
BRANCH="lineage-16.0"

repo init -u $MANIFEST_URL -b $BRANCH
repo sync --force-sync --no-tag --no-clone-bundle --optimized-fetch --current-branch -f -j16

git clone $ORG_URL/android_device_huawei_prague -b $BRANCH device/huawei/prague
git clone $ORG_URL/android_device_huawei_hi6250-common -b $BRANCH device/huawei/hi6250-common
git clone $ORG_URL/proprietary_vendor_huawei_hi6250-common -b $BRANCH vendor/huawei/hi6250-common
git clone $ORG_URL/patches -b $BRANCH patches/patches

git clone https://github.com/phhusson/treble_experimentations
. treble_experimentations/apply-patches.sh patches

cd lineage-sdk
git fetch https://github.com/prague-dev/android_lineage-sdk
git cherry-pick 12cf176bb25f81b92f57017ed566c34677fffd10
cd ..

. build/envsetup.sh
lunch lineage_prague-userdebug
mka bacon -j32
