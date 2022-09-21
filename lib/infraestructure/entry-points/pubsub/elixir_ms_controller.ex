defmodule ElixirMs.EntryPoint.PubSubsRedis do
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

    Redix.PubSub.start_link(host: redis_host_credentials, port: String.to_integer(redis_port_credentials), name: :redixps)
    Redix.PubSub.subscribe(:redixps, "my_channel", self())
  end

  def handle_info({:redix_pubsub, _pubsub, _ref, :subscribed, %{channel: channel}}, state) do
    IO.inspect "Subscription: #{channel}"
    {:noreply, state}
  end

  def handle_info(msg, state) do
    case msg do
      {:redix_pubsub, _, _, :message, %{payload: payload}} -> IO.inspect(payload)
      other -> IO.inspect(other)
    end

    #IO.inspect(msg)
    {:noreply, state}
  end
end
