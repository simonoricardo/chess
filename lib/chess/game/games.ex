defmodule Chess.Game.Games do
  use Chess, :context
  alias Chess.Board.Boards

  def generate_game_start_state() do
    %{
      turn: :white,
      pieces: [
        %{type: :pawn, colour: :white, column: "A", row: 2, has_moved: false, id: 1},
        %{type: :pawn, colour: :white, column: "B", row: 2, has_moved: false, id: 2},
        %{type: :pawn, colour: :white, column: "C", row: 2, has_moved: false, id: 3},
        %{type: :pawn, colour: :white, column: "D", row: 2, has_moved: false, id: 4},
        %{type: :pawn, colour: :white, column: "E", row: 2, has_moved: false, id: 5},
        %{type: :pawn, colour: :white, column: "F", row: 2, has_moved: false, id: 6},
        %{type: :pawn, colour: :white, column: "G", row: 2, has_moved: false, id: 7},
        %{type: :pawn, colour: :white, column: "H", row: 2, has_moved: false, id: 8},
        %{type: :rook, colour: :white, column: "A", row: 1, has_moved: false, id: 9},
        %{type: :rook, colour: :white, column: "H", row: 1, has_moved: false, id: 10},
        %{type: :knight, colour: :white, column: "B", row: 1, has_moved: false, id: 11},
        %{type: :knight, colour: :white, column: "G", row: 1, has_moved: false, id: 12},
        %{type: :bishop, colour: :white, column: "C", row: 1, has_moved: false, id: 13},
        %{type: :bishop, colour: :white, column: "F", row: 1, has_moved: false, id: 14},
        %{type: :queen, colour: :white, column: "D", row: 1, has_moved: false, id: 15},
        %{type: :king, colour: :white, column: "E", row: 1, has_moved: false, id: 16},
        %{type: :pawn, colour: :black, column: "A", row: 7, has_moved: false, id: 17},
        %{type: :pawn, colour: :black, column: "B", row: 7, has_moved: false, id: 18},
        %{type: :pawn, colour: :black, column: "C", row: 7, has_moved: false, id: 19},
        %{type: :pawn, colour: :black, column: "D", row: 7, has_moved: false, id: 20},
        %{type: :pawn, colour: :black, column: "E", row: 7, has_moved: false, id: 21},
        %{type: :pawn, colour: :black, column: "F", row: 7, has_moved: false, id: 22},
        %{type: :pawn, colour: :black, column: "G", row: 7, has_moved: false, id: 23},
        %{type: :pawn, colour: :black, column: "H", row: 7, has_moved: false, id: 24},
        %{type: :rook, colour: :black, column: "A", row: 8, has_moved: false, id: 25},
        %{type: :rook, colour: :black, column: "H", row: 8, has_moved: false, id: 26},
        %{type: :knight, colour: :black, column: "B", row: 8, has_moved: false, id: 27},
        %{type: :knight, colour: :black, column: "G", row: 8, has_moved: false, id: 28},
        %{type: :bishop, colour: :black, column: "C", row: 8, has_moved: false, id: 29},
        %{type: :bishop, colour: :black, column: "F", row: 8, has_moved: false, id: 30},
        %{type: :queen, colour: :black, column: "D", row: 8, has_moved: false, id: 31},
        %{type: :king, colour: :black, column: "E", row: 8, has_moved: false, id: 32}
      ]
    }
  end

  def generate_possible_moves(%{turn: colour, pieces: pieces} = state) do
    result =
      pieces
      |> Enum.filter(&(&1.colour === colour))
      |> Enum.map(fn piece ->
        moves = get_legal_move(state, piece)
        Map.put(piece, :moves, moves)
      end)

    all_pieces = result ++ pieces

    %{state | pieces: Enum.uniq_by(all_pieces, & &1.id)}
  end

  def get_legal_move(
        %{pieces: all_pieces} = _state,
        %{type: :pawn, row: p_row, column: p_column, has_moved: false, id: _p_id} = _playing_piece
      ) do
    p_column = Boards.convert_letters_to_number(p_column)

    possible_pawn_moves(p_row, p_column)
    |> Enum.map(fn %{row: new_row, column: new_column} = move ->
      found_collision =
        Enum.find(all_pieces, fn %{row: row, column: column, id: _id} = _piece ->
          column = Boards.convert_letters_to_number(column)
          row == new_row and column == new_column
        end)

      cond do
        not is_nil(found_collision) and new_column != found_collision.column -> move
        not is_nil(found_collision) and new_column == found_collision.column -> nil
        is_nil(found_collision) and new_column == p_column -> move
        is_nil(found_collision) and new_column != p_column -> nil
      end
    end)
    |> Enum.reject(&(&1 == nil))
  end

  def get_legal_move(_state, _playing_piece), do: []

  defp possible_pawn_moves(row, column) do
    [
      %{
        row: row + 1,
        column: column
      },
      %{
        row: row + 2,
        column: column
      },
      %{
        row: row + 1,
        column: column + 1
      },
      %{
        row: row + 1,
        column: column - 1
      }
    ]
  end
end
