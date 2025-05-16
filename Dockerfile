FROM golang:alpine

WORKDIR /app

RUN apk add --no-cache git bash ca-certificates

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 3000

CMD ["./start.sh"]
