FROM nvidia/opencl:devel AS build

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
    OPENCL_LIBRARIES=/usr/lib/x86_64-linux-gnu
    OPENCL_INCLUDE_DIR=/usr/include/CL
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    wget \
    ca-certificates \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    git \
    cmake \
    libboost-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    gcc \
    g++ && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/src/lightgbm
RUN git clone --recursive --branch stable --depth 1 https://github.com/microsoft/LightGBM && \
    cd LightGBM && mkdir build && cd build && \
    cmake -DUSE_GPU=1 -DOpenCL_LIBRARY=${OPENCL_LIBRARIES}/libOpenCL.so -DOpenCL_INCLUDE_DIR=${OPENCL_INCLUDE_DIR} .. && \
    make OPENCL_HEADERS=${OPENCL_INCLUDE_DIR} LIBOPENCL=${OPENCL_LIBRARIES}

FROM nvidia/opencl:runtime
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libxext6 libsm6 libxrender1 libboost-system-dev libboost-filesystem-dev gcc g++ && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /usr/local/src/lightgbm/LightGBM/lightgbm /lightgbm

ENTRYPOINT ["/lightgbm"]
