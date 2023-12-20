defmodule DesignPatternsTest do
  use ExUnit.Case
  doctest DesignPatterns

  test "greets the world" do
    assert DesignPatterns.hello() == :world
  end
end
