#include <iostream>
#include <cuda_runtime.h>

// Declare the kernel function
__global__ void addKernel(int* c, const int* a, const int* b, int size);

void addArrays(const int* a, const int* b, int* c, int size) {
    int *d_a, *d_b, *d_c;

    // Allocate GPU memory
    cudaMalloc((void**)&d_a, size * sizeof(int));
    cudaMalloc((void**)&d_b, size * sizeof(int));
    cudaMalloc((void**)&d_c, size * sizeof(int));

    // Copy data to the device
    cudaMemcpy(d_a, a, size * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, size * sizeof(int), cudaMemcpyHostToDevice);

    // Launch CUDA kernel
    int threadsPerBlock = 256;
    int blocksPerGrid = (size + threadsPerBlock - 1) / threadsPerBlock;
    addKernel<<<blocksPerGrid, threadsPerBlock>>>(d_c, d_a, d_b, size);

    // Copy result back to the host
    cudaMemcpy(c, d_c, size * sizeof(int), cudaMemcpyDeviceToHost);

    // Free GPU memory
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);
}

int main() {
    const int arraySize = 5;
    int a[arraySize] = {1, 2, 3, 4, 5};
    int b[arraySize] = {10, 20, 30, 40, 50};
    int c[arraySize] = {0};

    addArrays(a, b, c, arraySize);

    std::cout << "Result: ";
    for (int i = 0; i < arraySize; ++i) {
        std::cout << c[i] << " ";
    }
    std::cout << std::endl;

    return 0;
}
