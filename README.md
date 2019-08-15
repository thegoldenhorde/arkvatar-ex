# Arkvatar-ex

API Wrapper to interact with Arkvatar.

## Built with

- [Elixir](https://elixir-lang.org/)
- [Tesla](https://github.com/teamon/tesla)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `arkvatar` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:arkvatar, "~> 1.0.0"}
  ]
end
```

Now you can run the `mix deps.get` command from your shell.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elixir_arkvatar](https://hexdocs.pm/elixir_arkvatar).

## Usage

### Fetching an arkvatar

```elixir
$ iex -S mix

iex(1)> Arkvatar.Api.show("test@gmail.com")
{:ok, ... }
```

### Verifying an identifier

```elixir
$ iex -S mix

iex(1)> Arkvatar.Api.verify("test@gmail.com")
{:ok, ... }
```

### Creating a new Arkvatar

```elixir
$ iex -S mix

# Without specifying the type
iex(1)> Arkvatar.Api.store(%{identifier: "test@gmail.com")}
{:ok, ... }

# With a type
iex(2)> Arkvatar.Api.store(%{type: "Email", identifier: "test@gmail.com")}
{:ok, ... }

# With full parameters 
iex(3)> Arkvatar.Api.store(%{type: "Email", identifier: "test@gmail.com", qr_code: true, vertical_gradient: true, no_background: false})


```

## Authors

- Jolan Beer - Highjhacker

## License

Arkvatar-ex is under MIT license. See the [LICENSE file](https://github.com/thegoldenhorde/arkvatar-ex/blob/master/LICENSE) for more informations.
