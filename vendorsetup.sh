#!/bin/bash
echo -e "\033[33mDeseja clonar as dependências? (s/n)\033[0m"
read resposta

if [ "$resposta" = "s" ]; then
echo -e "\033[32mInicializando...\033[0m"
# Vendor
echo ""
git clone -b thirteen https://github.com/Team-NoobMaster69/vendor_motorola_aljeter.git vendor/motorola/aljeter
echo ""

# Kernel
echo ""
git clone -b aljeter-337 https://github.com/Team-NoobMaster69/kernel_motorola_msm8937.git kernel/motorola/msm8937
echo ""

# KSU
cd kernel/motorola/msm8937
git submodule update --init --recursive
cd -

# Dependencies
echo ""
git clone -b lineage-18.1 https://github.com/LineageOS/android_external_sony_boringssl-compat external/sony/boringssl-compat
git clone -b lineage-20 https://github.com/LineageOS/android_system_qcom system/qcom
git clone -b lineage-20 https://github.com/LineageOS/android_hardware_motorola hardware/motorola
echo ""

# DtbTools Lineage
echo ""
mkdir  -p out/host/linux-x86/bin
cd out/host/linux-x86/bin
wget -c https://github.com/krasCGQ/scripts/raw/master/prebuilts/bin/dtbToolLineage
chmod +777 dtbToolLineage
cd ../../../..
echo ""

# HAL's
echo -e "\033[33mClonando as HALs...\033[0m"
rm -rf hardware/qcom-caf/msm8996/audio
git clone https://github.com/LineageOS/android_hardware_qcom_audio -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/audio
rm -rf hardware/qcom-caf/msm8996/media
git clone https://github.com/LineageOS/android_hardware_qcom_media -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/media
rm -rf hardware/qcom-caf/msm8996/display
git clone https://github.com/LineageOS/android_hardware_qcom_display -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/display
echo -e "\033[32m Tudo no seu devido lugar, Boa compilação!!\033[0m"
else
echo -e "\033[31mAs dependências foram puladas!!\033[0m"
fi
