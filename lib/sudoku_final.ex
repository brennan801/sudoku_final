defmodule SudokuFinal do
  use Plug.Router

  plug(Plug.Logger)

  plug :match
  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  plug :dispatch

  get "/" do
    IO.inspect(conn)
    send_resp(conn, 200, "Welcome to suduku challenge. Please go to /instructions to start the test.")
    |> IO.inspect
  end
  post "/endpoint" do
    IO.inspect conn
    value = conn.body_params["key"]
    send_resp(conn, 200, Poison.encode!(%{"your value was" => value}))
  end

  def hello do
    :world
  end

  get "/request_board" do
    board = Poison.encode!(%{"board"=>
     [ %Cell{x: 1,y: 9,value: 0}, %Cell{x: 2,y: 9,value: 0}, %Cell{x: 3,y: 9,value: 0}, %Cell{x: 4,y: 9,value: 2}, %Cell{x: 5,y: 9,value: 6}, %Cell{x: 6,y: 9,value: 0}, %Cell{x: 7,y: 9,value: 7}, %Cell{x: 8,y: 9,value: 0}, %Cell{x: 9,y: 9,value: 1},
     %Cell{x: 1,y: 8,value: 6}, %Cell{x: 2,y: 8,value: 8}, %Cell{x: 3,y: 8,value: 0}, %Cell{x: 4,y: 8,value: 0}, %Cell{x: 5,y: 8,value: 7}, %Cell{x: 6,y: 8,value: 0}, %Cell{x: 7,y: 8,value: 0}, %Cell{x: 8,y: 8,value: 9}, %Cell{x: 9,y: 8,value: 0},
     %Cell{x: 1,y: 7,value: 1}, %Cell{x: 2,y: 7,value: 9}, %Cell{x: 3,y: 7,value: 0}, %Cell{x: 4,y: 7,value: 0}, %Cell{x: 5,y: 7,value: 0}, %Cell{x: 6,y: 7,value: 4}, %Cell{x: 7,y: 7,value: 5}, %Cell{x: 8,y: 7,value: 0}, %Cell{x: 9,y: 7,value: 0},
     %Cell{x: 1,y: 6,value: 8}, %Cell{x: 2,y: 6,value: 2}, %Cell{x: 3,y: 6,value: 0}, %Cell{x: 4,y: 6,value: 1}, %Cell{x: 5,y: 6,value: 0}, %Cell{x: 6,y: 6,value: 0}, %Cell{x: 7,y: 6,value: 0}, %Cell{x: 8,y: 6,value: 4}, %Cell{x: 9,y: 6,value: 0},
     %Cell{x: 1,y: 5,value: 0}, %Cell{x: 2,y: 5,value: 0}, %Cell{x: 3,y: 5,value: 4}, %Cell{x: 4,y: 5,value: 6}, %Cell{x: 5,y: 5,value: 0}, %Cell{x: 6,y: 5,value: 2}, %Cell{x: 7,y: 5,value: 9}, %Cell{x: 8,y: 5,value: 0}, %Cell{x: 9,y: 5,value: 0},
     %Cell{x: 1,y: 4,value: 0}, %Cell{x: 2,y: 4,value: 5}, %Cell{x: 3,y: 4,value: 0}, %Cell{x: 4,y: 4,value: 0}, %Cell{x: 5,y: 4,value: 0}, %Cell{x: 6,y: 4,value: 3}, %Cell{x: 7,y: 4,value: 0}, %Cell{x: 8,y: 4,value: 2}, %Cell{x: 9,y: 4,value: 8},
     %Cell{x: 1,y: 3,value: 0}, %Cell{x: 2,y: 3,value: 0}, %Cell{x: 3,y: 3,value: 9}, %Cell{x: 4,y: 3,value: 3}, %Cell{x: 5,y: 3,value: 0}, %Cell{x: 6,y: 3,value: 0}, %Cell{x: 7,y: 3,value: 0}, %Cell{x: 8,y: 3,value: 7}, %Cell{x: 9,y: 3,value: 4},
     %Cell{x: 1,y: 2,value: 0}, %Cell{x: 2,y: 2,value: 4}, %Cell{x: 3,y: 2,value: 0}, %Cell{x: 4,y: 2,value: 0}, %Cell{x: 5,y: 2,value: 5}, %Cell{x: 6,y: 2,value: 0}, %Cell{x: 7,y: 2,value: 0}, %Cell{x: 8,y: 2,value: 3}, %Cell{x: 9,y: 2,value: 6},
     %Cell{x: 1,y: 1,value: 7}, %Cell{x: 2,y: 1,value: 0}, %Cell{x: 3,y: 1,value: 3}, %Cell{x: 4,y: 1,value: 0}, %Cell{x: 5,y: 1,value: 1}, %Cell{x: 6,y: 1,value: 8}, %Cell{x: 7,y: 1,value: 0}, %Cell{x: 8,y: 1,value: 0}, %Cell{x: 9,y: 1,value: 0}]})
    send_resp(conn, 200, board)
    # send_resp(conn, 200,"time")
  end

  get "/instructions" do
    send_resp(conn, 200, "Start by getting the board by going to /request_board. This will send the starting board as JSON. You need to solve the board and send it back at /send_completed_board. We will check your sent board for correctness and send back a responce if it is right or wrong.")
  end

  post "/send_completed_board" do

    correctBoard = Poison.encode!( [%Cell{x: 1,y: 9,value: 4}, %Cell{x: 2,y: 9,value: 3}, %Cell{x: 3,y: 9,value: 5}, %Cell{x: 4,y: 9,value: 2}, %Cell{x: 5,y: 9,value: 6}, %Cell{x: 6,y: 9,value: 9}, %Cell{x: 7,y: 9,value: 7}, %Cell{x: 8,y: 9,value: 8}, %Cell{x: 9,y: 9,value: 1},
    %Cell{x: 1,y: 8,value: 6}, %Cell{x: 2,y: 8,value: 8}, %Cell{x: 3,y: 8,value: 2}, %Cell{x: 4,y: 8,value: 5}, %Cell{x: 5,y: 8,value: 7}, %Cell{x: 6,y: 8,value: 1}, %Cell{x: 7,y: 8,value: 4}, %Cell{x: 8,y: 8,value: 9}, %Cell{x: 9,y: 8,value: 3},
    %Cell{x: 1,y: 7,value: 1}, %Cell{x: 2,y: 7,value: 9}, %Cell{x: 3,y: 7,value: 7}, %Cell{x: 4,y: 7,value: 8}, %Cell{x: 5,y: 7,value: 3}, %Cell{x: 6,y: 7,value: 4}, %Cell{x: 7,y: 7,value: 5}, %Cell{x: 8,y: 7,value: 6}, %Cell{x: 9,y: 7,value: 2},
    %Cell{x: 1,y: 6,value: 8}, %Cell{x: 2,y: 6,value: 2}, %Cell{x: 3,y: 6,value: 6}, %Cell{x: 4,y: 6,value: 1}, %Cell{x: 5,y: 6,value: 9}, %Cell{x: 6,y: 6,value: 5}, %Cell{x: 7,y: 6,value: 3}, %Cell{x: 8,y: 6,value: 4}, %Cell{x: 9,y: 6,value: 7},
    %Cell{x: 1,y: 5,value: 3}, %Cell{x: 2,y: 5,value: 7}, %Cell{x: 3,y: 5,value: 4}, %Cell{x: 4,y: 5,value: 6}, %Cell{x: 5,y: 5,value: 8}, %Cell{x: 6,y: 5,value: 2}, %Cell{x: 7,y: 5,value: 9}, %Cell{x: 8,y: 5,value: 1}, %Cell{x: 9,y: 5,value: 5},
    %Cell{x: 1,y: 4,value: 9}, %Cell{x: 2,y: 4,value: 5}, %Cell{x: 3,y: 4,value: 1}, %Cell{x: 4,y: 4,value: 7}, %Cell{x: 5,y: 4,value: 4}, %Cell{x: 6,y: 4,value: 3}, %Cell{x: 7,y: 4,value: 6}, %Cell{x: 8,y: 4,value: 2}, %Cell{x: 9,y: 4,value: 8},
    %Cell{x: 1,y: 3,value: 5}, %Cell{x: 2,y: 3,value: 1}, %Cell{x: 3,y: 3,value: 9}, %Cell{x: 4,y: 3,value: 3}, %Cell{x: 5,y: 3,value: 2}, %Cell{x: 6,y: 3,value: 6}, %Cell{x: 7,y: 3,value: 8}, %Cell{x: 8,y: 3,value: 7}, %Cell{x: 9,y: 3,value: 4},
    %Cell{x: 1,y: 2,value: 2}, %Cell{x: 2,y: 2,value: 4}, %Cell{x: 3,y: 2,value: 8}, %Cell{x: 4,y: 2,value: 9}, %Cell{x: 5,y: 2,value: 5}, %Cell{x: 6,y: 2,value: 7}, %Cell{x: 7,y: 2,value: 1}, %Cell{x: 8,y: 2,value: 3}, %Cell{x: 9,y: 2,value: 6},
    %Cell{x: 1,y: 1,value: 7}, %Cell{x: 2,y: 1,value: 6}, %Cell{x: 3,y: 1,value: 3}, %Cell{x: 4,y: 1,value: 4}, %Cell{x: 5,y: 1,value: 1}, %Cell{x: 6,y: 1,value: 8}, %Cell{x: 7,y: 1,value: 2}, %Cell{x: 8,y: 1,value: 5}, %Cell{x: 9,y: 1,value: 9},
  ]
    )
    
    curr_boar= Enum.sort(Poison.decode!(correctBoard))
    |>IO.inspect
 
    
    #IO.inspect conn
    {status, body} =
      case conn.params do
        %{"board" => board} -> {200, board}
        _ -> {422, "error"}
      end

    IO.inspect body

    

      case Solver.compare_boards(curr_boar, Enum.sort(body)) do
        :true -> send_resp(conn, status, "that is correct")
        _->  send_resp(conn, status, "that is wrong start over")
      end

    # send_resp(conn, status, "Success!")


  end

  post "/hello" do
    IO.inspect conn.body_params # Prints JSON POST body
    send_resp(conn, 200, "Success!")
  end
 
  match _ do
    send_resp(conn, 404, "oops... Nothing here :(")
  end

end


    