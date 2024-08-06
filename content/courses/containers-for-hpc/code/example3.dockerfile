FROM ubuntu:16.04 AS build

RUN apt-get update && apt-get install -y --no-install-recommends \
        fortune fortunes-min && \
    rm -rf /var/lib/apt/lists/*

FROM scratch

# fortune
COPY --from=build /usr/games/fortune /usr/games/fortune
COPY --from=build /usr/lib/x86_64-linux-gnu/librecode.so.0 /usr/lib/x86_64-linux-gnu/librecode.so.0
COPY --from=build /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=build /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2

# fortunes-min
COPY --from=build /usr/share/doc/fortunes-min/ /usr/share/doc/fortunes-min/
COPY --from=build /usr/share/games/fortunes/ /usr/share/games/fortunes/

ENV PATH=/usr/games:${PATH}

ENTRYPOINT ["fortune"]
