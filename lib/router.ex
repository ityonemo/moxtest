
defmodule Shim.Router.Helper do

  #map the @http value to the mox shim
  @http Application.fetch_env!(:moxtest, :http_api)

  def get() do

    res = @http.get("http://localhost:4501/")
    IO.inspect res
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = res
    IO.inspect body
    IO.puts("\n===========")
    body
  end

end

defmodule Shim.Router do
  use Plug.Router
  import Shim.Router.Helper

  plug(
    Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison
  )

  plug(:match)
  plug(:dispatch)

  get "/" do
    body = Shim.Router.Helper.get
    send_resp(conn, 200, body)
  end
end
