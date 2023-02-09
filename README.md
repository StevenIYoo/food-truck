# FoodTruck

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


## How to use
  * run server with `iex -S mix phx.server`
  * navigate to [`localhost:4000/api/food-trucks/random`](localhost:4000/api/food-trucks/random)
  * This will return an api json payload referenced by `data:`
  * The app is also currently being hosted at Gigalixir [here](https://food-truck.gigalixirapp.com/api/food-trucks/random)
  * You can also generate html docs with `ex_doc` by running `mix docs` in the root directory of the app. Output is the `/doc` directory

## Functionality
<p>The app services a single api endpoints at</p> 
`[host]/api/food-trucks/random` 
<p>which will return a json payload of a randomly selected food truck</p>

Open `doc/architecture.html` for details on design decisions.