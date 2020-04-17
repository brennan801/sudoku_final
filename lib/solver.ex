defmodule Solver do
  def board_solver do

  end
  def get_possibles(starting_cell, board) do
    y_val = starting_cell.y
    x_val = starting_cell.x

    nonet_x = div((x_val - 1),3) + 1
    nonet_y = div((y_val - 1),3) + 1

    Enum.filter(board, fn %Cell{x: x, y: y} ->
      local_nonet_x = div((x - 1),3) + 1
      local_nonet_y = div((y - 1),3) + 1
      case {x,y} do
          {val_x, val_y} when val_x == x_val or
          val_y == y_val or
          (local_nonet_x == nonet_x and local_nonet_y == nonet_y) -> true
          _ -> false
      end
    end)
    |> Enum.map(fn %Cell{value: value} ->  value end)
    |> Enum.uniq()
    |> unused_values()
  end

  def unused_values(used_values)do
    [0,1,2,3,4,5,6,7,8,9]
    |> Enum.filter(fn i ->
      !Enum.member?(used_values, i)
    end)

  end
  def find_empty_cell(board) do
    Enum.find(board, fn %Cell{value: value} ->
        case value do
          0 -> true
          _ -> false
        end
      end)
  end

end
