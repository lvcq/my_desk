FROM elixir:alpine-latest


COPY . /app

WORKDIR /app

# Installs hex locally
RUN mix local.hex --force

#Installs rebar locally
RUN mix local.rebar --force

# Clean appsignal. If we don’t do this, it can’t compile on a second build
RUN mix deps.clean appsignal

# Installs all dependencies for production
RUN mix deps.get --only-prod

# Compiles application
RUN MIX_ENV=prod mix release my_desk

# Set Port
ENV PORT 8080


# Run App
CMD ["_build/prod/rel/my_desk/bin/my_desk", "start"]
