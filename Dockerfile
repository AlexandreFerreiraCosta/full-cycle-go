FROM golang:latest AS builder

WORKDIR /app

COPY . /app

RUN go build -o hellogo hello.go

FROM scratch

WORKDIR /app
COPY --from=builder /app/hellogo ./

CMD [ "./hellogo" ]