defmodule Moxtest do
end

defmodule Moxtest.HTTPAPI do
  @callback get(path :: String.t()) :: {:ok, HTTPoison.Response.t()}
end
