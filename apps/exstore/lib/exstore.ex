defmodule EXSTORE do
  @moduledoc """
  Documentation for EXSTORE.
  """
  use Application

  @doc """
  Hello world.

  ## Examples

      iex> EXSTORE.hello()
      :world

  """
  def hello do
    :world
  end

  @impl true
  def start(_type, _args) do
    EXSTORE.Supervisor.start_link(name: EXSTORE.Supervisor)
  end
end
