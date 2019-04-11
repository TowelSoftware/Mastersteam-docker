# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from golang v1.11 base image
FROM golang:1.11

RUN go version

# Add Maintainer Info
LABEL maintainer="Towel Software <hello@towel.dk>"

# Install some dependencies needed to build the project1
RUN go get github.com/TowelSoftware/Mastersteam

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/github.com/TowelSoftware/Mastersteam

# Download all the dependencies
# https://stackoverflow.com/questions/28031603/what-do-three-dots-mean-in-go-command-line-invocations
RUN go get -d -v ./...

# Install the package
RUN go install -v ./...

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["Mastersteam"]