# Build Stage
FROM golang:1.19-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o main main.go

# Final Stage
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/main .
CMD ["./main"]
