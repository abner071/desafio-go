FROM golang:alpine AS builder

WORKDIR /fullcycle
RUN go mod init main
COPY main.go .
RUN go build main.go

FROM scratch

WORKDIR /
COPY --from=builder /fullcycle/main .

CMD [ "./main" ]