FROM golang:1.3    as base
WORKDIR   /app
COPY . .
RUN  go build -o main .
#finalstage
FROM gcr.io/distroless/base
COPY --from=base /app .
EXPOSE 8080
CMD [ "./main" ]
