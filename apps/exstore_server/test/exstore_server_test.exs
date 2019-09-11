defmodule EXSTOREServerTest do
  use ExUnit.Case
  doctest EXSTOREServer

  test "greets the world" do
    assert EXSTOREServer.hello() == :world
  end
end
