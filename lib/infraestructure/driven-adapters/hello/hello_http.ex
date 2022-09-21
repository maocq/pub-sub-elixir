defmodule ElixirMs.Adapters.Hello do
  #alias ElixirMs.DrivenAdapters.Secrets.SecretManagerAdapter

  @behaviour ElixirMs.Model.Behaviour.HelloRepository

  @spec hello(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def hello(value) do
    case Redix.command(:redix, ["PUBLISH", "my_channel", value]) do
      {:ok, _num} -> {:ok, value}
      _ -> {:error, value}
    end
  end
end
