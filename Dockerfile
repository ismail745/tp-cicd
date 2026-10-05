FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY build/install/app/ /app/
ENTRYPOINT ["/app/bin/app"]
