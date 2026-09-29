FROM golang:1.26.2

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./
COPY tracker.db ./

ENV CGO_ENABLED=1
RUN go build -o parcel_app .

CMD ["/app/parcel_app"]