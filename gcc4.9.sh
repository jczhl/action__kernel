echo "===================Setup Export========================="
export ARCH=arm64
export CROSS_COMPILE=$GITHUB_WORKSPACE/kernel/tool/aarch/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=$GITHUB_WORKSPACE/kernel/tool/arm/bin/arm-linux-androideabi-
echo "===================Setup Environment==================="
cd $GITHUB_WORKSPACE/kernel
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 -b lineage-18.1 tool/aarch
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9 -b lineage-18.1 tool/arm
sh -c "$(curl -sSL https://github.com/akhilnarang/scripts/raw/master/setup/android_build_env.sh/)"
echo "=========================Clean========================="
make mrproper && git reset --hard HEAD
echo "=========================make========================="
make O=out m3note_defconfig
make O=out
