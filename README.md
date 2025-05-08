# Clerk Ex

An Elixir library for interacting with the [Clerk API](https://clerk.com/docs/reference/backend-api)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `clerk_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:clerk_ex, "~> 0.1.0"}
  ]
end
```

## Setup

Create/get your [Clerk Secret Key](https://dashboard.clerk.com/).
Add the following to your `config/config.exs`:

```elixir
config :clerk_ex,
  url: "https://api.clerk.com", # optional
  secret: "YOUR_CLERK_SECRET_KEY"
```
