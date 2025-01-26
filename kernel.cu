#include <cuda_runtime.h>

__global__ void addKernel(int* c, const int* a, const int* b, int size) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < size) {
        c[i] = a[i] + b[i];
    }
}
