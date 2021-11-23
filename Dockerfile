FROM rust:1.56-buster as build-stage

WORKDIR /app
COPY . .

RUN cd tooling/cli.rs && cargo build --release

FROM scratch AS export-stage
COPY --from=build-stage /app/tooling/cli.rs/target /