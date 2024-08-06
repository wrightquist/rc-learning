FROM gcc:10.2 AS build
RUN apt-get update && apt-get install -y --no-install-recommends libopenblas-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt
COPY cblas_dgemm.c ./
RUN gcc -o cblas_dgemm cblas_dgemm.c -lopenblas -lpthread

FROM scratch
COPY --from=build /opt/cblas_dgemm /cblas_dgemm

COPY --from=build \
    /lib/x86_64-linux-gnu/libc.so.6 \
    /lib/x86_64-linux-gnu/libm.so.6 \
    /lib/x86_64-linux-gnu/libpthread.so.0 \
    /lib/x86_64-linux-gnu/

COPY --from=build /usr/lib/x86_64-linux-gnu/libopenblas.so.0 /usr/lib/x86_64-linux-gnu/libopenblas.so.0

COPY --from=build \
    /usr/local/lib64/libgcc_s.so.1 \
    /usr/local/lib64/libquadmath.so.0 \
    /usr/local/lib64/libgfortran.so.5 \
    /usr/local/lib64/

COPY --from=build /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2

ENV LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH

ENTRYPOINT ["/cblas_dgemm"]
