FROM node:16 AS build-env
COPY /app /app
WORKDIR /app

RUN npm ci --only=production

FROM gcr.io/distroless/nodejs:16
USER 1000
COPY --from=build-env /app /app
WORKDIR /app
CMD ["server.js"]
