FROM exla:cuda10.2

# Update

RUN apt-get update
RUN apt-get install vim -y

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

ENV MIX_ENV=prod
COPY livebook /livebook

WORKDIR /livebook
RUN mix deps.get --only prod

CMD ["mix", "phx.server"]
