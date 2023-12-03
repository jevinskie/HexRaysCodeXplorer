# https://github.com/google/binexport/blob/main/cmake/FindIdaSdk.cmake
# Copyright 2011-2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# FindHexRaysSdk
# ----------
#
# Locates and configures the HexRays SDK.
#
# Use this module by invoking find_package with the form:
#
#   find_package(HexRaysSdk
#                [REQUIRED]  # Fail with an error if IDA SDK is not found
#               )
#
# Defines the following variables:
#
#   HexRaysSdk_INCLUDE_DIRS - Include directories for the IDA Pro SDK.
#
# This module reads hints about search locations from variables:
#
#   HexRaysSdk_ROOT_DIR  - Preferred installation prefix
#   HEXRAYSSDK_ROOT      - Preferred installation prefix (evironment variable)
#
# Example (this assumes Windows):
#
#   find_package(HexRaysSdk REQUIRED)


find_path(HexRaysSdk_DIR NAMES include/hexrays.hpp
         HINTS ${HexRaysSdk_ROOT_DIR} ENV HEXRAYSSDK_ROOT
         PATHS ${CMAKE_CURRENT_LIST_DIR}/../third_party/hexrayssdk
         DOC "Location of the HexRays SDK"
         NO_DEFAULT_PATH)
set(HexRaysSdk_INCLUDE_DIRS ${HexRaysSdk_DIR}/include)

find_package_handle_standard_args(
  HexRaysSdk FOUND_VAR HexRaysSdk_FOUND
         REQUIRED_VARS HexRaysSdk_DIR
                       HexRaysSdk_INCLUDE_DIRS
         FAIL_MESSAGE "HexRays SDK not found, try setting HexRaysSdk_ROOT_DIR or HEXRAYSSDK_ROOT env var")
