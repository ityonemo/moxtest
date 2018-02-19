defmodule MoxtestTest do
  use ExUnit.Case
  import Mox

  test "test route mocked result function" do
    Moxtest.MockHTTP
      |> expect(:get, fn _ ->
        {:ok, %HTTPoison.Response{status_code: 200, body: "result"}}
      end)
    assert Shim.Router.Helper.get == "result"
  end

  test "test route mocked full http path" do
    Moxtest.MockHTTP
      |> expect(:get, fn _ ->
        {:ok, %HTTPoison.Response{status_code: 200, body: "result"}}
      end)
    z = HTTPoison.get("http://localhost:4500/")
    IO.inspect(z)
  end
end
