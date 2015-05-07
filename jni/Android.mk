LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := libcurve25519-donna
LOCAL_SRC_FILES := curve25519-donna.c

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

ed_25519_sources := $(wildcard $(LOCAL_PATH)/ed25519/*.c)
ed_25519_sources := $(ed_25519_sources:$(LOCAL_PATH)/ed25519/%=%)

ed_25519_additions_sources := $(wildcard $(LOCAL_PATH)/ed25519/additions/*.c)
ed_25519_additions_sources := $(ed_25519_additions_sources:$(LOCAL_PATH)/ed25519/additions/%=%)

ed_25519_nacl_sources := $(wildcard $(LOCAL_PATH)/ed25519/nacl_sha512/*.c)
ed_25519_nacl_sources := $(ed_25519_nacl_sources:$(LOCAL_PATH)/ed25519/nacl_sha512/%=%)

LOCAL_MODULE     := libcurve25519-ref10
LOCAL_SRC_FILES  := \
    $(ed_25519_sources:%=ed25519/%) \
    $(ed_25519_additions_sources:%=ed25519/additions/%) \
    $(ed_25519_nacl_sources:%=ed25519/nacl_sha512/%)

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/ed25519/nacl_includes \
    $(LOCAL_PATH)/ed25519/additions \
    $(LOCAL_PATH)/ed25519/sha512 \
    $(LOCAL_PATH)/ed25519

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE     := libcurve25519
LOCAL_SRC_FILES  := curve25519-jni.c
LOCAL_C_INCLUDES := ed25519/additions

LOCAL_STATIC_LIBRARIES := libcurve25519-donna libcurve25519-ref10

include $(BUILD_SHARED_LIBRARY)

