RKIPC_SITE = $(TOPDIR)/../app/rkipc
RKIPC_SITE_METHOD = local

RKIPC_DEPENDENCIES = camera-engine-rkaiq wpa_supplicant freetype common_algorithm

ifeq ($(BR2_PACKAGE_RKIPC_RK3588), y)
    RKIPC_CONF_OPTS += -DCOMPILE_FOR_RK3588=ON
endif

ifeq ($(BR2_PACKAGE_RKIPC_RK3588_MULTI_IPC), y)
    RKIPC_CONF_OPTS += -DCOMPILE_FOR_RK3588_MULTI_IPC=ON
endif

ifeq ($(BR2_PACKAGE_RKIPC_RV1126), y)
    RKIPC_DEPENDENCIES += rkmedia
    RKIPC_CONF_OPTS += -DCOMPILE_FOR_RV1126_RKMEDIA=ON
endif

$(eval $(cmake-package))
