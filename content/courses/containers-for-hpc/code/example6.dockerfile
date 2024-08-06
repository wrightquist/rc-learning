FROM gcc:10.2 AS build

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential cmake \
        wget ca-certificates unzip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN wget -q https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-1.7.1%2Bcpu.zip -O libtorch.zip && \
    unzip libtorch.zip && rm libtorch.zip

WORKDIR /opt/dcgan
COPY dcgan.cpp CMakeLists.txt ./

RUN mkdir build && cd build && cmake .. && make

FROM scratch
COPY --from=build /opt/dcgan/build/dcgan /dcgan

COPY --from=build \
    /lib/x86_64-linux-gnu/libc.so.6 \
    /lib/x86_64-linux-gnu/libdl.so.2 \
    /lib/x86_64-linux-gnu/libm.so.6 \
    /lib/x86_64-linux-gnu/libpthread.so.0 \
    /lib/x86_64-linux-gnu/librt.so.1 \
    /lib/x86_64-linux-gnu/

COPY --from=build \
    /opt/libtorch/lib/libc10.so \
    /opt/libtorch/lib/libgomp-75eea7e8.so.1 \
    /opt/libtorch/lib/libtorch.so \
    /opt/libtorch/lib/libtorch_cpu.so \
    /opt/libtorch/lib/

COPY --from=build \
    /usr/local/lib64/libgcc_s.so.1 \
    /usr/local/lib64/libstdc++.so.6 \
    /usr/local/lib64/

COPY --from=build /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2

ENV LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
ENTRYPOINT ["/dcgan"]
