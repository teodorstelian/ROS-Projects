"""
Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved.

NVIDIA CORPORATION and its licensors retain all intellectual property
and proprietary rights in and to this software, related documentation
and any modifications thereto. Any use, reproduction, disclosure or
distribution of this software and related documentation without an express
license agreement from NVIDIA CORPORATION is strictly prohibited.
"""

"""
Procedure to build libtorch:

Visit https://github.com/pytorch/pytorch/tree/v1.1.0 and follow the process to build libtorch.
Following are configuration options to be set as environment variables:
    BUILD_BINARY=1
    BUILD_TORCH=1
    USE_NCCL=0
    USE_MPI=0
    TORCH_CUDA_ARCH_LIST="5.3;6.2;7.2+PTX"
    BUILD_TEST=0
    USE_MIOPEN=0
    USE_DISTRIBUTED=0
    USE_OPENMP=0
    USE_FBGEMM=0
    USE_MKLDNN=0
    USE_NNPACK=0
    USE_QNNPACK=0
    USE_SYSTEM_NCCL=0
"""

cc_library(
    name = "root_aarch64_jetpack42",
    srcs = glob([
        "libtorch_aarch64_jetpack42/lib/libc10.so",
        "libtorch_aarch64_jetpack42/lib/libc10_cuda.so",
        "libtorch_aarch64_jetpack42/lib/libcaffe2.so",
        "libtorch_aarch64_jetpack42/lib/libcaffe2_gpu.so",
        "libtorch_aarch64_jetpack42/lib/libthnvrtc.so",
        "libtorch_aarch64_jetpack42/lib/libtorch.so.1",
        "libtorch_aarch64_jetpack42/lib/libprotobuf.a",
    ]),
    hdrs = glob(["libtorch_aarch64_jetpack42/include/**/*.h"]),
    strip_include_prefix = "libtorch_aarch64_jetpack42/include",
)

cc_library(
    name = "csrc_aarch64_jetpack42",
    hdrs = glob(["libtorch_aarch64_jetpack42/include/torch/csrc/api/include/**/*.h"]),
    strip_include_prefix = "libtorch_aarch64_jetpack42/include/torch/csrc/api/include",
)

cc_library(
    name = "libtorch_aarch64_jetpack42",
    visibility = ["//visibility:public"],
    deps = [
        "csrc_aarch64_jetpack42",
        "root_aarch64_jetpack42",
    ],
)
