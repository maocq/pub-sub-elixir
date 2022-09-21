defmodule ElixirMs.Model.Behaviour.HelloRepository do

  @callback hello(String.t()) :: {:ok, String.t()} | {:error, String.t()}
end
