defmodule LatencySimulator.App do
  @moduledoc false


  use Application

  def start(_type, _args) do
    IO.puts "Latency Simulator Started!"
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: LatencySimulator,
        options: [port: 8080]
      )
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end