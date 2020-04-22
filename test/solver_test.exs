defmodule SolverTest do
  use ExUnit.Case
  doctest SudokuFinal

    # test "find empty cells" do
    #   board = [
    #     %Cell{x: 1,y: 9,value: 0}, %Cell{x: 2,y: 9,value: 0}, %Cell{x: 3,y: 9,value: 0}, %Cell{x: 4,y: 9,value: 2}, %Cell{x: 5,y: 9,value: 6}, %Cell{x: 6,y: 9,value: 0}, %Cell{x: 7,y: 9,value: 7}, %Cell{x: 8,y: 9,value: 0}, %Cell{x: 9,y: 9,value: 1},
    #     %Cell{x: 1,y: 8,value: 6}, %Cell{x: 2,y: 8,value: 8}, %Cell{x: 3,y: 8,value: 0}, %Cell{x: 4,y: 8,value: 0}, %Cell{x: 5,y: 8,value: 7}, %Cell{x: 6,y: 8,value: 0}, %Cell{x: 7,y: 8,value: 0}, %Cell{x: 8,y: 8,value: 9}, %Cell{x: 9,y: 8,value: 0},
    #     %Cell{x: 1,y: 7,value: 1}, %Cell{x: 2,y: 7,value: 9}, %Cell{x: 3,y: 7,value: 0}, %Cell{x: 4,y: 7,value: 0}, %Cell{x: 5,y: 7,value: 0}, %Cell{x: 6,y: 7,value: 4}, %Cell{x: 7,y: 7,value: 5}, %Cell{x: 8,y: 7,value: 0}, %Cell{x: 9,y: 7,value: 0},
    #     %Cell{x: 1,y: 6,value: 8}, %Cell{x: 2,y: 6,value: 2}, %Cell{x: 3,y: 6,value: 0}, %Cell{x: 4,y: 6,value: 1}, %Cell{x: 5,y: 6,value: 0}, %Cell{x: 6,y: 6,value: 0}, %Cell{x: 7,y: 6,value: 0}, %Cell{x: 8,y: 6,value: 4}, %Cell{x: 9,y: 6,value: 0},
    #     %Cell{x: 1,y: 5,value: 0}, %Cell{x: 2,y: 5,value: 0}, %Cell{x: 3,y: 5,value: 4}, %Cell{x: 4,y: 5,value: 6}, %Cell{x: 5,y: 5,value: 0}, %Cell{x: 6,y: 5,value: 2}, %Cell{x: 7,y: 5,value: 9}, %Cell{x: 8,y: 5,value: 0}, %Cell{x: 9,y: 5,value: 0},
    #     %Cell{x: 1,y: 4,value: 0}, %Cell{x: 2,y: 4,value: 5}, %Cell{x: 3,y: 4,value: 0}, %Cell{x: 4,y: 4,value: 0}, %Cell{x: 5,y: 4,value: 0}, %Cell{x: 6,y: 4,value: 3}, %Cell{x: 7,y: 4,value: 0}, %Cell{x: 8,y: 4,value: 2}, %Cell{x: 9,y: 4,value: 8},
    #     %Cell{x: 1,y: 3,value: 0}, %Cell{x: 2,y: 3,value: 0}, %Cell{x: 3,y: 3,value: 9}, %Cell{x: 4,y: 3,value: 3}, %Cell{x: 5,y: 3,value: 0}, %Cell{x: 6,y: 3,value: 0}, %Cell{x: 7,y: 3,value: 0}, %Cell{x: 8,y: 3,value: 7}, %Cell{x: 9,y: 3,value: 4},
    #     %Cell{x: 1,y: 2,value: 0}, %Cell{x: 2,y: 2,value: 4}, %Cell{x: 3,y: 2,value: 0}, %Cell{x: 4,y: 2,value: 0}, %Cell{x: 5,y: 2,value: 5}, %Cell{x: 6,y: 2,value: 0}, %Cell{x: 7,y: 2,value: 0}, %Cell{x: 8,y: 2,value: 3}, %Cell{x: 9,y: 2,value: 6},
    #     %Cell{x: 1,y: 1,value: 7}, %Cell{x: 2,y: 1,value: 0}, %Cell{x: 3,y: 1,value: 3}, %Cell{x: 4,y: 1,value: 0}, %Cell{x: 5,y: 1,value: 1}, %Cell{x: 6,y: 1,value: 8}, %Cell{x: 7,y: 1,value: 0}, %Cell{x: 8,y: 1,value: 0}, %Cell{x: 9,y: 1,value: 0},
    #   ]

    #   empty_cell = Solver.find_empty_cells(board)
    #   assert empty_cell == %Cell{x: 1,y: 9,value: 0}
    # end

    # test "possible values from row" do
    #   board = [
    #     %Cell{x: 1,y: 9,value: 0}, %Cell{x: 2,y: 9,value: 0}, %Cell{x: 3,y: 9,value: 0}, %Cell{x: 4,y: 9,value: 2}, %Cell{x: 5,y: 9,value: 6}, %Cell{x: 6,y: 9,value: 0}, %Cell{x: 7,y: 9,value: 7}, %Cell{x: 8,y: 9,value: 0}, %Cell{x: 9,y: 9,value: 1},
    #     %Cell{x: 1,y: 8,value: 6}, %Cell{x: 2,y: 8,value: 8}, %Cell{x: 3,y: 8,value: 0}, %Cell{x: 4,y: 8,value: 0}, %Cell{x: 5,y: 8,value: 7}, %Cell{x: 6,y: 8,value: 0}, %Cell{x: 7,y: 8,value: 0}, %Cell{x: 8,y: 8,value: 9}, %Cell{x: 9,y: 8,value: 0},
    #     %Cell{x: 1,y: 7,value: 1}, %Cell{x: 2,y: 7,value: 9}, %Cell{x: 3,y: 7,value: 0}, %Cell{x: 4,y: 7,value: 0}, %Cell{x: 5,y: 7,value: 0}, %Cell{x: 6,y: 7,value: 4}, %Cell{x: 7,y: 7,value: 5}, %Cell{x: 8,y: 7,value: 0}, %Cell{x: 9,y: 7,value: 0},
    #     %Cell{x: 1,y: 6,value: 8}, %Cell{x: 2,y: 6,value: 2}, %Cell{x: 3,y: 6,value: 0}, %Cell{x: 4,y: 6,value: 1}, %Cell{x: 5,y: 6,value: 0}, %Cell{x: 6,y: 6,value: 0}, %Cell{x: 7,y: 6,value: 0}, %Cell{x: 8,y: 6,value: 4}, %Cell{x: 9,y: 6,value: 0},
    #     %Cell{x: 1,y: 5,value: 0}, %Cell{x: 2,y: 5,value: 0}, %Cell{x: 3,y: 5,value: 4}, %Cell{x: 4,y: 5,value: 6}, %Cell{x: 5,y: 5,value: 0}, %Cell{x: 6,y: 5,value: 2}, %Cell{x: 7,y: 5,value: 9}, %Cell{x: 8,y: 5,value: 0}, %Cell{x: 9,y: 5,value: 0},
    #     %Cell{x: 1,y: 4,value: 0}, %Cell{x: 2,y: 4,value: 5}, %Cell{x: 3,y: 4,value: 0}, %Cell{x: 4,y: 4,value: 0}, %Cell{x: 5,y: 4,value: 0}, %Cell{x: 6,y: 4,value: 3}, %Cell{x: 7,y: 4,value: 0}, %Cell{x: 8,y: 4,value: 2}, %Cell{x: 9,y: 4,value: 8},
    #     %Cell{x: 1,y: 3,value: 0}, %Cell{x: 2,y: 3,value: 0}, %Cell{x: 3,y: 3,value: 9}, %Cell{x: 4,y: 3,value: 3}, %Cell{x: 5,y: 3,value: 0}, %Cell{x: 6,y: 3,value: 0}, %Cell{x: 7,y: 3,value: 0}, %Cell{x: 8,y: 3,value: 7}, %Cell{x: 9,y: 3,value: 4},
    #     %Cell{x: 1,y: 2,value: 0}, %Cell{x: 2,y: 2,value: 4}, %Cell{x: 3,y: 2,value: 0}, %Cell{x: 4,y: 2,value: 0}, %Cell{x: 5,y: 2,value: 5}, %Cell{x: 6,y: 2,value: 0}, %Cell{x: 7,y: 2,value: 0}, %Cell{x: 8,y: 2,value: 3}, %Cell{x: 9,y: 2,value: 6},
    #     %Cell{x: 1,y: 1,value: 7}, %Cell{x: 2,y: 1,value: 0}, %Cell{x: 3,y: 1,value: 3}, %Cell{x: 4,y: 1,value: 0}, %Cell{x: 5,y: 1,value: 1}, %Cell{x: 6,y: 1,value: 8}, %Cell{x: 7,y: 1,value: 0}, %Cell{x: 8,y: 1,value: 0}, %Cell{x: 9,y: 1,value: 0},
    #   ]
    #   possible_values = Solver.find_empty_cell(board)
    #   |>Solver.get_possibles(board)
    #   assert Enum.sort(possible_values) == Enum.sort([3,4,5])
    # end

    # test "unused values" do
    #   used_values = [0, 1, 5, 7, 9]
    #   unused_values = Solver.unused_values(used_values)
    #   assert Enum.sort(unused_values) == Enum.sort([2, 3, 4, 6, 8])
    # end

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
      {:false, actual_board} = Solver.solve_board(starting_board)
      assert(actual_board == expected_board)
    end
end

