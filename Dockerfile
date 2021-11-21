FROM elixir:1.11.2

ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID devel
RUN useradd -u $UID -g $GID -m otajisan

COPY --chown=otajisan:devel . /work
USER otajisan
WORKDIR /work
RUN mix local.hex --force

ENTRYPOINT ["./entrypoint.sh"]