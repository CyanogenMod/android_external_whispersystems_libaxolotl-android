# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# The libaxolotl android module
LOCAL_MODULE := axolotl-android
LOCAL_REQUIRED_MODULES := curve25519-java

libaxolotl_android_src := android/src/main/java
libaxolotl_java_src := java/src/main/java

LOCAL_SRC_FILES := \
    $(call all-java-files-under, $(libaxolotl_java_src)) \
    $(call all-java-files-under, $(libaxolotl_android_src))

LOCAL_STATIC_JAVA_LIBRARIES := \
    libphonenumbergoogle \
    curve25519-java \
    protobuf-java-2.5.0

include $(BUILD_STATIC_JAVA_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := libs/protobuf-java-2.5.0.jar
LOCAL_MODULE := protobuf-java-2.5.0
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT)/fake_packages/$(LOCAL_SRC_FILES)

include $(BUILD_PREBUILT)
