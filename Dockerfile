FROM golang:1.3    AS   dev
WORKDIR   /app
COPY . .
RUN  go build -o main .
#finalstage
FROM gcr.io/distroless/base
COPY --from=web /app .
EXPOSE 8080
CMD [ ",/main" ]