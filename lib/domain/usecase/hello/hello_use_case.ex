defmodule ElixirMs.UseCase.HelloUseCase do
  @moduledoc false

  @hello_repository Application.compile_env(:elixir_ms, :hello_repository)

  @spec hello(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def hello(value) do
    @hello_repository.hello(value)
  end
end
