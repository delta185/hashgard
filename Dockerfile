# Simple usage with a mounted data directory:
# > docker build -t hashgard .
# > docker run -it -p 46657:46657 -p 46656:46656 -v ~/.hashgardd:/root/.hashgardd -v ~/.hashgardcli:/root/.hashgardcli hashgard hashgardd init
# > docker run -it -p 46657:46657 -p 46656:46656 -v ~/.hashgardd:/root/.hashgardd -v ~/.hashgardcli:/root/.hashgardcli hashgard hashgardd start
FROM golang:alpine AS build-env

# Set up dependencies
ENV PACKAGES curl make git libc-dev bash gcc linux-headers eudev-dev python3

# Set working directory for the build
WORKDIR /go/src/github.com/hashgard/hashgard

# Add source files
COPY . .

# Install minimum necessary dependencies, build Hashgard SDK, remove packages
RUN apk add --no-cache $PACKAGES && \
    make tools && \
    make install

# Final image
FROM alpine:edge

# Install ca-certificates
RUN apk add --update ca-certificates
WORKDIR /root

# Copy over binaries from the build-env
COPY --from=build-env /go/bin/hashgardd /usr/bin/hashgardd
COPY --from=build-env /go/bin/hashgardcli /usr/bin/hashgardcli

# Run hashgardd by default, omit entrypoint to ease using container with hashgardcli
CMD ["hashgardd"]
