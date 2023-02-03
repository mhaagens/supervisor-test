defmodule DemoAppTest do
  use ExUnit.Case
  doctest DemoApp

  test "greets the world" do
    assert DemoApp.hello() == :world
  end
end
