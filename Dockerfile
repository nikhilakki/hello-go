FROM golang:1.21.5-buster as builder
# Stage 1: Build the Go application
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .
# Stage 2: Create a lightweight image
FROM alpine:3.19.0
WORKDIR /app
# Copy the binary from the builder stage
COPY --from=builder /app/app .
# Expose the port the app runs on
EXPOSE 8080
# Command to run the executable
CMD ["./app"]
