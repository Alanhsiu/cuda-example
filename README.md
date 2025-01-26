# CUDA Example Project

This project demonstrates the integration of CUDA with C++ using CMake.

## Prerequisites

- CUDA Toolkit (version 11.7 or later)
- CMake (version 3.10 or later)
- GCC (compatible with your CUDA version)

## Setup Instructions

1. **Set Environment Variables**
   Ensure CUDA paths are correctly set. Add the following to your `~/.bashrc`:
   ```bash
    export PATH=/usr/local/cuda/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
    source ~/.bashrc
    ```

2. **Build the Project**
    ```bash
    mkdir build
    cd build
    cmake ..
    make
    ```

3. **Run the Executable**
    ```bash
    ./cuda_example
    ```
