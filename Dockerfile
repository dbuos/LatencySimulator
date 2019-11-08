FROM elixir:1.9-alpine
WORKDIR /app
COPY . /app
RUN rm -rf _build
RUN mix local.hex --force
RUN mix local.rebar --force
RUN MIX_ENV=prod mix release

FROM elixir:1.9-alpine
WORKDIR /app
EXPOSE 8080
COPY --from=0 /app/_build/prod /app
ENTRYPOINT exec /app/rel/latency_simulator/bin/latency_simulator start