defmodule MadlibsTest do
  use ExUnit.Case
  doctest Madlibs

  test "greets the world" do
    assert Madlibs.hello() == :world
  end
end
