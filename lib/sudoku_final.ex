defmodule SudokuFinal do
  use Plug.Router
  plug :match
  plug :dispatch
  get "/" do
    IO.inspect(conn)
    conn
    send_resp(conn, 200, "it worked")
    |> IO.inspect
  end
  post "/endpoint" do
    IO.inspect conn
    value = conn.body_params["key"]
    send_resp(conn, 200, Poison.encode!(%{"your value was" => value}))
  end

  @doc """
  Hello world.

  ## Examples

      iex> SudokuFinal.hello()
      :world

  """
  def hello do
    :world
  end
end
