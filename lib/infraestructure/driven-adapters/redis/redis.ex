defmodule ElixirMs.DrivenAdapters.Redis do
  @moduledoc """
    Redis
  """
  alias ElixirMs.DrivenAdapters.Secrets.SecretManagerAdapter

  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(_args) do
    %{
        redis_host_credentials: redis_host_credentials,
        redis_port_credentials: redis_port_credentials
    } = SecretManagerAdapter.get_secret()
    Redix.start_link(host: redis_host_credentials, port: String.to_integer(redis_port_credentials), name: :redix)
  end

  @spec health :: {:ok, true} | {:error, term}
  def health() do
    case Redix.command(:redix, ["PING"]) do
      {:ok, "PONG"} -> {:ok, true}
      {:error, error} -> {:error, error}
    end
  end
end
