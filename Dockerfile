FROM gcc as builder
WORKDIR /app
COPY mygroup.c .
RUN gcc -o mygroup -static mygroup.c

FROM busybox
COPY --from=builder /app/mygroup /app/mygroup
CMD ["/bin/sh", "-c", "/app/mygroup"]
