FROM ubuntu:noble
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
WORKDIR /app
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y libstdc++6 openssl libncurses6 locales ca-certificates && \
    apt-get clean && \
    rm -f /var/lib/apt/lists/*_* && \
    sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
COPY ./_build/prod/rel/tunez/ ./
RUN groupadd --system --gid 2000 elixir && \
    useradd elixir --uid 2000 --gid 2000 && \
    mkdir data && \
    chown -R elixir:elixir /app
USER 2000:2000
CMD ["./bin/server"]
