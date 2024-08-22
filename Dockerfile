# Stage 1: Build the Go application
FROM golang:1.20-alpine AS builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if go.mod and go.sum are not changed
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go application
RUN go build -o go-api .

# Stage 2: Create a smaller image for running the Go application
FROM alpine:latest

# Set environment variables
ENV GO_ENV=production

# Expose the application on port 3000
EXPOSE 3000

# Copy the binary from the builder stage
COPY --from=builder /app/go-api /go-api

# Run the Go application
CMD ["/go-api"]