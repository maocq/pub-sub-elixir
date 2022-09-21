defmodule ElixirMs.Config.AppConfig do
  @moduledoc false

  defstruct [
    :timezone,
    :http_port,
    :enable_server,
    :secret_name,
    :region,
    :token_exp,
    :cache_expiration,
    :version,
    :redis_host_credentials,
    :redis_port_credentials
  ]

  def load_config do
    %__MODULE__{
      timezone: load(:timezone),
      http_port: load(:http_port),
      enable_server: load(:enable_server),
      secret_name: load(:secret_name),
      region: load(:region),
      token_exp: load(:token_exp),
      cache_expiration: load(:cache_expiration),
      version: load(:version),
      redis_host_credentials: load(:redis_host_credentials),
      redis_port_credentials: load(:redis_port_credentials)
    }
  end

  defp load(property_name), do: Application.fetch_env!(:elixir_ms, property_name)
end
