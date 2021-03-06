# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from golang v1.12 base image
FROM golang:1.12-alpine AS builder
LABEL maintainer="Towel Software <hello@towel.dk>"

# Install git
RUN apk update && apk add --no-cache git

# Install some dependencies needed to build the project1
RUN go get github.com/TowelSoftware/Mastersteam

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/github.com/TowelSoftware/Mastersteam

# Download all the dependencies
# https://stackoverflow.com/questions/28031603/what-do-three-dots-mean-in-go-command-line-invocations
RUN go get -d -v ./...

# Install the package
RUN go install -v ./...

RUN cp $GOPATH/bin/Mastersteam /usr/local/bin/Mastersteam

FROM alpine:3.5
LABEL maintainer="Towel Software <hello@towel.dk>"

WORKDIR /usr/local/bin

COPY --from=builder /usr/local/bin/Mastersteam .

# We'll likely need to add SSL root certificates
RUN apk --no-cache add ca-certificates

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["Mastersteam"]
