FROM golang:1.22.6-alpine as builder
WORKDIR /app
COPY go.mod .
COPY main.go .
RUN go build -o myapp

FROM scratch
WORKDIR /root/
COPY --from=builder /app/myapp .
CMD ["./myapp"]