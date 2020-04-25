defmodule Solver do

  # def grab_column(board, column)do
  #   Enum.map(board, fn  %Cell{x: x, y: y, value: value} ->
  #     case x do
  #       val when val == column ->
  #         %Cell{x: x, y: y, value: value}
  #     end
  #   end)
  # end

  # # def column_pass(board) do
  # #   grab_column(board, 1)
  # #   |>


  # # end
  # def single_value_pass(board) do
  #   changed_cell_count = 0
  #   find_empty_cells(board)
  #   |> Enum.map(fn %Cell{x: x, y: y, value: value} ->
  #       new_board = get_possibles(%Cell{x: x, y: y, value: value}, board, changed_cell_count)
  #   end)


  # end
  # def get_possibles(starting_cell, board, count) do
  #   y_val = starting_cell.y
  #   x_val = starting_cell.x

  #   nonet_x = div((x_val - 1),3) + 1
  #   nonet_y = div((y_val - 1),3) + 1

  #   returned = Enum.filter(board, fn %Cell{x: x, y: y} ->
  #     local_nonet_x = div((x - 1),3) + 1
  #     local_nonet_y = div((y - 1),3) + 1

  #     case {x,y} do
  #         {val_x, val_y} when val_x == x_val or
  #         val_y == y_val or
  #         (local_nonet_x == nonet_x and local_nonet_y == nonet_y) -> true
  #         _ -> false
  #     end
  #   end)
  #   |> Enum.map(fn %Cell{value: value} ->  value end)
  #   |> Enum.uniq()
  #   |> unused_values()

  #   # case returned do
  #   #   [single_value] ->
  #   #     new_count = count + 1
  #   #     new_board = set_cell(board, starting_cell, single_value)
  #   #     {new_board, new_count}
  #   #   _ -> {board, count}
  #   # end

  # end

  def unused_values(used_values)do
    [0,1,2,3,4,5,6,7,8,9]
    |> Enum.filter(fn i ->
      !Enum.member?(used_values, i)
    end)

  end
  def find_empty_cells(board) do
    Enum.filter(board, fn %Cell{value: value} ->
        case value do
          0 -> true
          _ -> false
        end
      end)
  end

  def set_cell(old_board, changing_cell, new_value) do
    changing_x = changing_cell.x
    changing_y = changing_cell.y
    Enum.map(old_board, fn %Cell{x: x, y: y, value: value} ->
      case {x,y} do
        {val_x, val_y} when val_x == changing_x and val_y == changing_y ->
          %Cell{x: x, y: y, value: new_value}
        _ -> %Cell{x: x, y: y, value: value}
        end
    end)
  end

  def solve_board(current_board)do
    current_board
    |> Enum.reduce({:false, current_board}, fn %Cell{}, acc ->
      case acc do
        {:true, board} -> {:true, board}
        {:false, board} ->
          case find_empty_cells(board) do
            [] -> {:true, board}
            empty_cells -> guess(empty_cells, board)
          end
        board -> board
      end
    end)
    |> case do
      {:true, board} -> board
      other -> other
    end
  end

  def guess([first | _], current_board) do
    possibilities = get_cell_possibles(first, current_board)
    case possibilities do
      [] -> {:false, current_board}
      _ -> Enum.reduce(possibilities, {:false, current_board}, fn possibility, acc->
            case acc do
              {:true, completed_board} -> {:true, completed_board}
              {:false, _} ->
                set_cell(current_board, first, possibility)
                |> solve_board()
              board -> board
            end
      end)
    end

  end
  def get_cell_possibles(starting_cell, board) do
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

  def compare_boards( board1, board2 ) do
    merged_board = Enum.concat(board1, board2)
    |> IO.inspect
  end



end

