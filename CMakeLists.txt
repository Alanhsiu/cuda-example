cmake_minimum_required(VERSION 3.10)

project(cuda_example LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CUDA_STANDARD 17)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)

set(CMAKE_CUDA_ARCHITECTURES 70 75 80 86)

add_executable(cuda_example
    main.cu
    kernel.cu
)

set_target_properties(cuda_example PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON
)
