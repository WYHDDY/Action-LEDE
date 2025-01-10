# DIY-2 此脚本功能：修改固件参数
# ============================================================================================


sed -i 's/Os/O2/g' include/target.mk

# 1-修改管理地址
sed -i 's/192.168.1.1/10.0.0.253/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/10.0.0.253/g' package/base-files/luci2/bin/config_generate

# 2-修改内核版本
sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=6.12/g' ./target/linux/x86/Makefile

# 3-删除默认密码
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings

# 4-修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 5-修改时间格式
sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 6-添加编译日期
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk
sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' ./include/image.mk