LOCAL_PATH:= $(call my-dir)
ifeq ($(TARGET_DEVICE),epicmtd)
include $(CLEAR_VARS)

# HAL module implemenation stored in
# hw/<COPYPIX_HARDWARE_MODULE_ID>.<ro.product.board>.so
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_C_INCLUDES += $(LOCAL_PATH)/../include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../libs3cjpeg
LOCAL_C_INCLUDES += frameworks/native/include/media/hardware

LOCAL_SRC_FILES:= \
	SecCamera.cpp \
	SecCameraHWInterface.cpp \
	SecCameraUtils.cpp \

LOCAL_SHARED_LIBRARIES:= libutils libcutils libbinder liblog libcamera_client libhardware
LOCAL_SHARED_LIBRARIES+= libs3cjpeg

LOCAL_MODULE := camera.s5pc110

LOCAL_MODULE_TAGS := optional

ifdef BOARD_SECOND_CAMERA_DEVICE
    LOCAL_CFLAGS += -DFFC_PRESENT
endif

ifeq ($(TARGET_DEVICE),epicmtd)
    LOCAL_CFLAGS += -DHAVE_FLASH
endif

include $(BUILD_SHARED_LIBRARY)

endif
