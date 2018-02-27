defmodule QuantumDemoTest do
  use ExUnit.Case
  doctest QuantumDemo

  test "greets the world" do
    assert QuantumDemo.hello() == :world
  end
end
