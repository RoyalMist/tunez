FROM ubuntu:jammy
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y libstdc++6 openssl libncurses6 locales ca-certificates && \
    apt-get clean && \
    rm -f /var/lib/apt/lists/*_*
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
WORKDIR "/app"
RUN chown nobody /app
COPY --chown=nobody:root ./_build/prod/rel/tunez/ ./
USER nobody
CMD ["./bin/migrate && ./bin/server"]
