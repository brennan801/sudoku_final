defmodule SolverTest do
  use ExUnit.Case
  doctest SudokuFinal

    test "solve easy board" do
      starting_board = [
        %Cell{x: 1,y: 9,value: 4}, %Cell{x: 2,y: 9,value: 3}, %Cell{x: 3,y: 9,value: 5}, %Cell{x: 4,y: 9,value: 2}, %Cell{x: 5,y: 9,value: 6}, %Cell{x: 6,y: 9,value: 9}, %Cell{x: 7,y: 9,value: 7}, %Cell{x: 8,y: 9,value: 8}, %Cell{x: 9,y: 9,value: 1},
        %Cell{x: 1,y: 8,value: 6}, %Cell{x: 2,y: 8,value: 8}, %Cell{x: 3,y: 8,value: 2}, %Cell{x: 4,y: 8,value: 5}, %Cell{x: 5,y: 8,value: 7}, %Cell{x: 6,y: 8,value: 1}, %Cell{x: 7,y: 8,value: 4}, %Cell{x: 8,y: 8,value: 9}, %Cell{x: 9,y: 8,value: 3},
        %Cell{x: 1,y: 7,value: 1}, %Cell{x: 2,y: 7,value: 9}, %Cell{x: 3,y: 7,value: 7}, %Cell{x: 4,y: 7,value: 8}, %Cell{x: 5,y: 7,value: 3}, %Cell{x: 6,y: 7,value: 4}, %Cell{x: 7,y: 7,value: 5}, %Cell{x: 8,y: 7,value: 6}, %Cell{x: 9,y: 7,value: 2},
        %Cell{x: 1,y: 6,value: 0}, %Cell{x: 2,y: 6,value: 2}, %Cell{x: 3,y: 6,value: 6}, %Cell{x: 4,y: 6,value: 1}, %Cell{x: 5,y: 6,value: 9}, %Cell{x: 6,y: 6,value: 5}, %Cell{x: 7,y: 6,value: 3}, %Cell{x: 8,y: 6,value: 4}, %Cell{x: 9,y: 6,value: 7},
        %Cell{x: 1,y: 5,value: 3}, %Cell{x: 2,y: 5,value: 7}, %Cell{x: 3,y: 5,value: 4}, %Cell{x: 4,y: 5,value: 6}, %Cell{x: 5,y: 5,value: 8}, %Cell{x: 6,y: 5,value: 2}, %Cell{x: 7,y: 5,value: 9}, %Cell{x: 8,y: 5,value: 1}, %Cell{x: 9,y: 5,value: 5},
        %Cell{x: 1,y: 4,value: 9}, %Cell{x: 2,y: 4,value: 5}, %Cell{x: 3,y: 4,value: 1}, %Cell{x: 4,y: 4,value: 7}, %Cell{x: 5,y: 4,value: 4}, %Cell{x: 6,y: 4,value: 3}, %Cell{x: 7,y: 4,value: 6}, %Cell{x: 8,y: 4,value: 2}, %Cell{x: 9,y: 4,value: 8},
        %Cell{x: 1,y: 3,value: 5}, %Cell{x: 2,y: 3,value: 1}, %Cell{x: 3,y: 3,value: 9}, %Cell{x: 4,y: 3,value: 3}, %Cell{x: 5,y: 3,value: 2}, %Cell{x: 6,y: 3,value: 6}, %Cell{x: 7,y: 3,value: 8}, %Cell{x: 8,y: 3,value: 7}, %Cell{x: 9,y: 3,value: 4},
        %Cell{x: 1,y: 2,value: 2}, %Cell{x: 2,y: 2,value: 4}, %Cell{x: 3,y: 2,value: 8}, %Cell{x: 4,y: 2,value: 9}, %Cell{x: 5,y: 2,value: 5}, %Cell{x: 6,y: 2,value: 7}, %Cell{x: 7,y: 2,value: 1}, %Cell{x: 8,y: 2,value: 3}, %Cell{x: 9,y: 2,value: 6},
        %Cell{x: 1,y: 1,value: 7}, %Cell{x: 2,y: 1,value: 6}, %Cell{x: 3,y: 1,value: 3}, %Cell{x: 4,y: 1,value: 4}, %Cell{x: 5,y: 1,value: 1}, %Cell{x: 6,y: 1,value: 8}, %Cell{x: 7,y: 1,value: 2}, %Cell{x: 8,y: 1,value: 5}, %Cell{x: 9,y: 1,value: 9},
      ]
      expected_board = [
        %Cell{x: 1,y: 9,value: 4}, %Cell{x: 2,y: 9,value: 3}, %Cell{x: 3,y: 9,value: 5}, %Cell{x: 4,y: 9,value: 2}, %Cell{x: 5,y: 9,value: 6}, %Cell{x: 6,y: 9,value: 9}, %Cell{x: 7,y: 9,value: 7}, %Cell{x: 8,y: 9,value: 8}, %Cell{x: 9,y: 9,value: 1},
        %Cell{x: 1,y: 8,value: 6}, %Cell{x: 2,y: 8,value: 8}, %Cell{x: 3,y: 8,value: 2}, %Cell{x: 4,y: 8,value: 5}, %Cell{x: 5,y: 8,value: 7}, %Cell{x: 6,y: 8,value: 1}, %Cell{x: 7,y: 8,value: 4}, %Cell{x: 8,y: 8,value: 9}, %Cell{x: 9,y: 8,value: 3},
        %Cell{x: 1,y: 7,value: 1}, %Cell{x: 2,y: 7,value: 9}, %Cell{x: 3,y: 7,value: 7}, %Cell{x: 4,y: 7,value: 8}, %Cell{x: 5,y: 7,value: 3}, %Cell{x: 6,y: 7,value: 4}, %Cell{x: 7,y: 7,value: 5}, %Cell{x: 8,y: 7,value: 6}, %Cell{x: 9,y: 7,value: 2},
        %Cell{x: 1,y: 6,value: 8}, %Cell{x: 2,y: 6,value: 2}, %Cell{x: 3,y: 6,value: 6}, %Cell{x: 4,y: 6,value: 1}, %Cell{x: 5,y: 6,value: 9}, %Cell{x: 6,y: 6,value: 5}, %Cell{x: 7,y: 6,value: 3}, %Cell{x: 8,y: 6,value: 4}, %Cell{x: 9,y: 6,value: 7},
        %Cell{x: 1,y: 5,value: 3}, %Cell{x: 2,y: 5,value: 7}, %Cell{x: 3,y: 5,value: 4}, %Cell{x: 4,y: 5,value: 6}, %Cell{x: 5,y: 5,value: 8}, %Cell{x: 6,y: 5,value: 2}, %Cell{x: 7,y: 5,value: 9}, %Cell{x: 8,y: 5,value: 1}, %Cell{x: 9,y: 5,value: 5},
        %Cell{x: 1,y: 4,value: 9}, %Cell{x: 2,y: 4,value: 5}, %Cell{x: 3,y: 4,value: 1}, %Cell{x: 4,y: 4,value: 7}, %Cell{x: 5,y: 4,value: 4}, %Cell{x: 6,y: 4,value: 3}, %Cell{x: 7,y: 4,value: 6}, %Cell{x: 8,y: 4,value: 2}, %Cell{x: 9,y: 4,value: 8},
        %Cell{x: 1,y: 3,value: 5}, %Cell{x: 2,y: 3,value: 1}, %Cell{x: 3,y: 3,value: 9}, %Cell{x: 4,y: 3,value: 3}, %Cell{x: 5,y: 3,value: 2}, %Cell{x: 6,y: 3,value: 6}, %Cell{x: 7,y: 3,value: 8}, %Cell{x: 8,y: 3,value: 7}, %Cell{x: 9,y: 3,value: 4},
        %Cell{x: 1,y: 2,value: 2}, %Cell{x: 2,y: 2,value: 4}, %Cell{x: 3,y: 2,value: 8}, %Cell{x: 4,y: 2,value: 9}, %Cell{x: 5,y: 2,value: 5}, %Cell{x: 6,y: 2,value: 7}, %Cell{x: 7,y: 2,value: 1}, %Cell{x: 8,y: 2,value: 3}, %Cell{x: 9,y: 2,value: 6},
        %Cell{x: 1,y: 1,value: 7}, %Cell{x: 2,y: 1,value: 6}, %Cell{x: 3,y: 1,value: 3}, %Cell{x: 4,y: 1,value: 4}, %Cell{x: 5,y: 1,value: 1}, %Cell{x: 6,y: 1,value: 8}, %Cell{x: 7,y: 1,value: 2}, %Cell{x: 8,y: 1,value: 5}, %Cell{x: 9,y: 1,value: 9},
      ]
      actual_board = Solver.solve_board(starting_board)
      # |> IO.inspect(label: "result of solved board.")
      # {:true, actual_board} = result
      assert(actual_board == expected_board)
    end

    test "solve real board" do
      starting_board =[
        %Cell{x: 1,y: 9,value: 0}, %Cell{x: 2,y: 9,value: 0}, %Cell{x: 3,y: 9,value: 0}, %Cell{x: 4,y: 9,value: 2}, %Cell{x: 5,y: 9,value: 6}, %Cell{x: 6,y: 9,value: 0}, %Cell{x: 7,y: 9,value: 7}, %Cell{x: 8,y: 9,value: 0}, %Cell{x: 9,y: 9,value: 1},
        %Cell{x: 1,y: 8,value: 6}, %Cell{x: 2,y: 8,value: 8}, %Cell{x: 3,y: 8,value: 0}, %Cell{x: 4,y: 8,value: 0}, %Cell{x: 5,y: 8,value: 7}, %Cell{x: 6,y: 8,value: 0}, %Cell{x: 7,y: 8,value: 0}, %Cell{x: 8,y: 8,value: 9}, %Cell{x: 9,y: 8,value: 0},
        %Cell{x: 1,y: 7,value: 1}, %Cell{x: 2,y: 7,value: 9}, %Cell{x: 3,y: 7,value: 0}, %Cell{x: 4,y: 7,value: 0}, %Cell{x: 5,y: 7,value: 0}, %Cell{x: 6,y: 7,value: 4}, %Cell{x: 7,y: 7,value: 5}, %Cell{x: 8,y: 7,value: 0}, %Cell{x: 9,y: 7,value: 0},
        %Cell{x: 1,y: 6,value: 8}, %Cell{x: 2,y: 6,value: 2}, %Cell{x: 3,y: 6,value: 0}, %Cell{x: 4,y: 6,value: 1}, %Cell{x: 5,y: 6,value: 0}, %Cell{x: 6,y: 6,value: 0}, %Cell{x: 7,y: 6,value: 0}, %Cell{x: 8,y: 6,value: 4}, %Cell{x: 9,y: 6,value: 0},
        %Cell{x: 1,y: 5,value: 0}, %Cell{x: 2,y: 5,value: 0}, %Cell{x: 3,y: 5,value: 4}, %Cell{x: 4,y: 5,value: 6}, %Cell{x: 5,y: 5,value: 0}, %Cell{x: 6,y: 5,value: 2}, %Cell{x: 7,y: 5,value: 9}, %Cell{x: 8,y: 5,value: 0}, %Cell{x: 9,y: 5,value: 0},
        %Cell{x: 1,y: 4,value: 0}, %Cell{x: 2,y: 4,value: 5}, %Cell{x: 3,y: 4,value: 0}, %Cell{x: 4,y: 4,value: 0}, %Cell{x: 5,y: 4,value: 0}, %Cell{x: 6,y: 4,value: 3}, %Cell{x: 7,y: 4,value: 0}, %Cell{x: 8,y: 4,value: 2}, %Cell{x: 9,y: 4,value: 8},
        %Cell{x: 1,y: 3,value: 0}, %Cell{x: 2,y: 3,value: 0}, %Cell{x: 3,y: 3,value: 9}, %Cell{x: 4,y: 3,value: 3}, %Cell{x: 5,y: 3,value: 0}, %Cell{x: 6,y: 3,value: 0}, %Cell{x: 7,y: 3,value: 0}, %Cell{x: 8,y: 3,value: 7}, %Cell{x: 9,y: 3,value: 4},
        %Cell{x: 1,y: 2,value: 0}, %Cell{x: 2,y: 2,value: 4}, %Cell{x: 3,y: 2,value: 0}, %Cell{x: 4,y: 2,value: 0}, %Cell{x: 5,y: 2,value: 5}, %Cell{x: 6,y: 2,value: 0}, %Cell{x: 7,y: 2,value: 0}, %Cell{x: 8,y: 2,value: 3}, %Cell{x: 9,y: 2,value: 6},
        %Cell{x: 1,y: 1,value: 7}, %Cell{x: 2,y: 1,value: 0}, %Cell{x: 3,y: 1,value: 3}, %Cell{x: 4,y: 1,value: 0}, %Cell{x: 5,y: 1,value: 1}, %Cell{x: 6,y: 1,value: 8}, %Cell{x: 7,y: 1,value: 0}, %Cell{x: 8,y: 1,value: 0}, %Cell{x: 9,y: 1,value: 0},
      ]
      expected_board = [
        %Cell{x: 1,y: 9,value: 4}, %Cell{x: 2,y: 9,value: 3}, %Cell{x: 3,y: 9,value: 5}, %Cell{x: 4,y: 9,value: 2}, %Cell{x: 5,y: 9,value: 6}, %Cell{x: 6,y: 9,value: 9}, %Cell{x: 7,y: 9,value: 7}, %Cell{x: 8,y: 9,value: 8}, %Cell{x: 9,y: 9,value: 1},
        %Cell{x: 1,y: 8,value: 6}, %Cell{x: 2,y: 8,value: 8}, %Cell{x: 3,y: 8,value: 2}, %Cell{x: 4,y: 8,value: 5}, %Cell{x: 5,y: 8,value: 7}, %Cell{x: 6,y: 8,value: 1}, %Cell{x: 7,y: 8,value: 4}, %Cell{x: 8,y: 8,value: 9}, %Cell{x: 9,y: 8,value: 3},
        %Cell{x: 1,y: 7,value: 1}, %Cell{x: 2,y: 7,value: 9}, %Cell{x: 3,y: 7,value: 7}, %Cell{x: 4,y: 7,value: 8}, %Cell{x: 5,y: 7,value: 3}, %Cell{x: 6,y: 7,value: 4}, %Cell{x: 7,y: 7,value: 5}, %Cell{x: 8,y: 7,value: 6}, %Cell{x: 9,y: 7,value: 2},
        %Cell{x: 1,y: 6,value: 8}, %Cell{x: 2,y: 6,value: 2}, %Cell{x: 3,y: 6,value: 6}, %Cell{x: 4,y: 6,value: 1}, %Cell{x: 5,y: 6,value: 9}, %Cell{x: 6,y: 6,value: 5}, %Cell{x: 7,y: 6,value: 3}, %Cell{x: 8,y: 6,value: 4}, %Cell{x: 9,y: 6,value: 7},
        %Cell{x: 1,y: 5,value: 3}, %Cell{x: 2,y: 5,value: 7}, %Cell{x: 3,y: 5,value: 4}, %Cell{x: 4,y: 5,value: 6}, %Cell{x: 5,y: 5,value: 8}, %Cell{x: 6,y: 5,value: 2}, %Cell{x: 7,y: 5,value: 9}, %Cell{x: 8,y: 5,value: 1}, %Cell{x: 9,y: 5,value: 5},
        %Cell{x: 1,y: 4,value: 9}, %Cell{x: 2,y: 4,value: 5}, %Cell{x: 3,y: 4,value: 1}, %Cell{x: 4,y: 4,value: 7}, %Cell{x: 5,y: 4,value: 4}, %Cell{x: 6,y: 4,value: 3}, %Cell{x: 7,y: 4,value: 6}, %Cell{x: 8,y: 4,value: 2}, %Cell{x: 9,y: 4,value: 8},
        %Cell{x: 1,y: 3,value: 5}, %Cell{x: 2,y: 3,value: 1}, %Cell{x: 3,y: 3,value: 9}, %Cell{x: 4,y: 3,value: 3}, %Cell{x: 5,y: 3,value: 2}, %Cell{x: 6,y: 3,value: 6}, %Cell{x: 7,y: 3,value: 8}, %Cell{x: 8,y: 3,value: 7}, %Cell{x: 9,y: 3,value: 4},
        %Cell{x: 1,y: 2,value: 2}, %Cell{x: 2,y: 2,value: 4}, %Cell{x: 3,y: 2,value: 8}, %Cell{x: 4,y: 2,value: 9}, %Cell{x: 5,y: 2,value: 5}, %Cell{x: 6,y: 2,value: 7}, %Cell{x: 7,y: 2,value: 1}, %Cell{x: 8,y: 2,value: 3}, %Cell{x: 9,y: 2,value: 6},
        %Cell{x: 1,y: 1,value: 7}, %Cell{x: 2,y: 1,value: 6}, %Cell{x: 3,y: 1,value: 3}, %Cell{x: 4,y: 1,value: 4}, %Cell{x: 5,y: 1,value: 1}, %Cell{x: 6,y: 1,value: 8}, %Cell{x: 7,y: 1,value: 2}, %Cell{x: 8,y: 1,value: 5}, %Cell{x: 9,y: 1,value: 9},
      ]
      actual_board = Solver.solve_board(starting_board)
      # |> IO.inspect(label: "result of solved board.")
      # {:true, actual_board} = result
      assert(actual_board == expected_board)
    end

    test "compare" do
     board1= [
      %Cell{x: 1,y: 9,value: 4}, %Cell{x: 2,y: 9,value: 3}, %Cell{x: 3,y: 9,value: 5}, %Cell{x: 4,y: 9,value: 2}, %Cell{x: 5,y: 9,value: 6}, %Cell{x: 6,y: 9,value: 9}, %Cell{x: 7,y: 9,value: 7}, %Cell{x: 8,y: 9,value: 8}, %Cell{x: 9,y: 9,value: 1},
      %Cell{x: 1,y: 8,value: 6}, %Cell{x: 2,y: 8,value: 8}, %Cell{x: 3,y: 8,value: 2}, %Cell{x: 4,y: 8,value: 5}, %Cell{x: 5,y: 8,value: 7}, %Cell{x: 6,y: 8,value: 1}, %Cell{x: 7,y: 8,value: 4}, %Cell{x: 8,y: 8,value: 9}, %Cell{x: 9,y: 8,value: 3},
      %Cell{x: 1,y: 7,value: 1}, %Cell{x: 2,y: 7,value: 9}, %Cell{x: 3,y: 7,value: 7}, %Cell{x: 4,y: 7,value: 8}, %Cell{x: 5,y: 7,value: 3}, %Cell{x: 6,y: 7,value: 4}, %Cell{x: 7,y: 7,value: 5}, %Cell{x: 8,y: 7,value: 6}, %Cell{x: 9,y: 7,value: 2},
      %Cell{x: 1,y: 6,value: 8}, %Cell{x: 2,y: 6,value: 2}, %Cell{x: 3,y: 6,value: 6}, %Cell{x: 4,y: 6,value: 1}, %Cell{x: 5,y: 6,value: 9}, %Cell{x: 6,y: 6,value: 5}, %Cell{x: 7,y: 6,value: 3}, %Cell{x: 8,y: 6,value: 4}, %Cell{x: 9,y: 6,value: 7},
      %Cell{x: 1,y: 5,value: 3}, %Cell{x: 2,y: 5,value: 7}, %Cell{x: 3,y: 5,value: 4}, %Cell{x: 4,y: 5,value: 6}, %Cell{x: 5,y: 5,value: 8}, %Cell{x: 6,y: 5,value: 2}, %Cell{x: 7,y: 5,value: 9}, %Cell{x: 8,y: 5,value: 1}, %Cell{x: 9,y: 5,value: 5},
      %Cell{x: 1,y: 4,value: 9}, %Cell{x: 2,y: 4,value: 5}, %Cell{x: 3,y: 4,value: 1}, %Cell{x: 4,y: 4,value: 7}, %Cell{x: 5,y: 4,value: 4}, %Cell{x: 6,y: 4,value: 3}, %Cell{x: 7,y: 4,value: 6}, %Cell{x: 8,y: 4,value: 2}, %Cell{x: 9,y: 4,value: 8},
      %Cell{x: 1,y: 3,value: 5}, %Cell{x: 2,y: 3,value: 1}, %Cell{x: 3,y: 3,value: 9}, %Cell{x: 4,y: 3,value: 3}, %Cell{x: 5,y: 3,value: 2}, %Cell{x: 6,y: 3,value: 6}, %Cell{x: 7,y: 3,value: 8}, %Cell{x: 8,y: 3,value: 7}, %Cell{x: 9,y: 3,value: 4},
      %Cell{x: 1,y: 2,value: 2}, %Cell{x: 2,y: 2,value: 4}, %Cell{x: 3,y: 2,value: 8}, %Cell{x: 4,y: 2,value: 9}, %Cell{x: 5,y: 2,value: 5}, %Cell{x: 6,y: 2,value: 7}, %Cell{x: 7,y: 2,value: 1}, %Cell{x: 8,y: 2,value: 3}, %Cell{x: 9,y: 2,value: 6},
      %Cell{x: 1,y: 1,value: 7}, %Cell{x: 2,y: 1,value: 6}, %Cell{x: 3,y: 1,value: 3}, %Cell{x: 4,y: 1,value: 4}, %Cell{x: 5,y: 1,value: 1}, %Cell{x: 6,y: 1,value: 8}, %Cell{x: 7,y: 1,value: 2}, %Cell{x: 8,y: 1,value: 5}, %Cell{x: 9,y: 1,value: 9},
    ]

     board2= [
      %Cell{x: 1,y: 9,value: 4}, %Cell{x: 2,y: 9,value: 3}, %Cell{x: 3,y: 9,value: 5}, %Cell{x: 4,y: 9,value: 2}, %Cell{x: 5,y: 9,value: 6}, %Cell{x: 6,y: 9,value: 9}, %Cell{x: 7,y: 9,value: 7}, %Cell{x: 8,y: 9,value: 8}, %Cell{x: 9,y: 9,value: 1},
      %Cell{x: 1,y: 8,value: 6}, %Cell{x: 2,y: 8,value: 8}, %Cell{x: 3,y: 8,value: 2}, %Cell{x: 4,y: 8,value: 5}, %Cell{x: 5,y: 8,value: 7}, %Cell{x: 6,y: 8,value: 1}, %Cell{x: 7,y: 8,value: 4}, %Cell{x: 8,y: 8,value: 9}, %Cell{x: 9,y: 8,value: 3},
      %Cell{x: 1,y: 7,value: 1}, %Cell{x: 2,y: 7,value: 9}, %Cell{x: 3,y: 7,value: 7}, %Cell{x: 4,y: 7,value: 8}, %Cell{x: 5,y: 7,value: 3}, %Cell{x: 6,y: 7,value: 4}, %Cell{x: 7,y: 7,value: 5}, %Cell{x: 8,y: 7,value: 6}, %Cell{x: 9,y: 7,value: 2},
      %Cell{x: 1,y: 6,value: 8}, %Cell{x: 2,y: 6,value: 2}, %Cell{x: 3,y: 6,value: 6}, %Cell{x: 4,y: 6,value: 1}, %Cell{x: 5,y: 6,value: 9}, %Cell{x: 6,y: 6,value: 5}, %Cell{x: 7,y: 6,value: 3}, %Cell{x: 8,y: 6,value: 4}, %Cell{x: 9,y: 6,value: 7},
      %Cell{x: 1,y: 5,value: 3}, %Cell{x: 2,y: 5,value: 7}, %Cell{x: 3,y: 5,value: 4}, %Cell{x: 4,y: 5,value: 6}, %Cell{x: 5,y: 5,value: 8}, %Cell{x: 6,y: 5,value: 2}, %Cell{x: 7,y: 5,value: 9}, %Cell{x: 8,y: 5,value: 1}, %Cell{x: 9,y: 5,value: 5},
      %Cell{x: 1,y: 4,value: 9}, %Cell{x: 2,y: 4,value: 5}, %Cell{x: 3,y: 4,value: 1}, %Cell{x: 4,y: 4,value: 7}, %Cell{x: 5,y: 4,value: 4}, %Cell{x: 6,y: 4,value: 3}, %Cell{x: 7,y: 4,value: 6}, %Cell{x: 8,y: 4,value: 2}, %Cell{x: 9,y: 4,value: 8},
      %Cell{x: 1,y: 3,value: 5}, %Cell{x: 2,y: 3,value: 1}, %Cell{x: 3,y: 3,value: 9}, %Cell{x: 4,y: 3,value: 3}, %Cell{x: 5,y: 3,value: 2}, %Cell{x: 6,y: 3,value: 6}, %Cell{x: 7,y: 3,value: 8}, %Cell{x: 8,y: 3,value: 7}, %Cell{x: 9,y: 3,value: 4},
      %Cell{x: 1,y: 2,value: 2}, %Cell{x: 2,y: 2,value: 4}, %Cell{x: 3,y: 2,value: 8}, %Cell{x: 4,y: 2,value: 9}, %Cell{x: 5,y: 2,value: 5}, %Cell{x: 6,y: 2,value: 7}, %Cell{x: 7,y: 2,value: 1}, %Cell{x: 8,y: 2,value: 3}, %Cell{x: 9,y: 2,value: 6},
      %Cell{x: 1,y: 1,value: 7}, %Cell{x: 2,y: 1,value: 6}, %Cell{x: 3,y: 1,value: 3}, %Cell{x: 4,y: 1,value: 4}, %Cell{x: 5,y: 1,value: 1}, %Cell{x: 6,y: 1,value: 8}, %Cell{x: 7,y: 1,value: 2}, %Cell{x: 8,y: 1,value: 5}, %Cell{x: 9,y: 1,value: 9},
    ]

     assert(true == Solver.compare_boards(board1, board2))


    end
end

