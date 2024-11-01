defmodule Chess.Game.Games do
  use Chess, :context

  def generate_game_start_state() do
    %{
      pieces: [
        %{type: :pawn, colour: :white, column: "A", row: 7},
        %{type: :pawn, colour: :white, column: "B", row: 7},
        %{type: :pawn, colour: :white, column: "C", row: 7},
        %{type: :pawn, colour: :white, column: "D", row: 7},
        %{type: :pawn, colour: :white, column: "E", row: 7},
        %{type: :pawn, colour: :white, column: "F", row: 7},
        %{type: :pawn, colour: :white, column: "G", row: 7},
        %{type: :pawn, colour: :white, column: "H", row: 7},
        %{type: :rook, colour: :white, column: "A", row: 8},
        %{type: :rook, colour: :white, column: "H", row: 8},
        %{type: :knight, colour: :white, column: "B", row: 8},
        %{type: :knight, colour: :white, column: "G", row: 8},
        %{type: :bishop, colour: :white, column: "C", row: 8},
        %{type: :bishop, colour: :white, column: "F", row: 8},
        %{type: :queen, colour: :white, column: "D", row: 8},
        %{type: :king, colour: :white, column: "E", row: 8},
        %{type: :pawn, colour: :black, column: "A", row: 2},
        %{type: :pawn, colour: :black, column: "B", row: 2},
        %{type: :pawn, colour: :black, column: "C", row: 2},
        %{type: :pawn, colour: :black, column: "D", row: 2},
        %{type: :pawn, colour: :black, column: "E", row: 2},
        %{type: :pawn, colour: :black, column: "F", row: 2},
        %{type: :pawn, colour: :black, column: "G", row: 2},
        %{type: :pawn, colour: :black, column: "H", row: 2},
        %{type: :rook, colour: :black, column: "A", row: 1},
        %{type: :rook, colour: :black, column: "H", row: 1},
        %{type: :knight, colour: :black, column: "B", row: 1},
        %{type: :knight, colour: :black, column: "G", row: 1},
        %{type: :bishop, colour: :black, column: "C", row: 1},
        %{type: :bishop, colour: :black, column: "F", row: 1},
        %{type: :queen, colour: :black, column: "D", row: 1},
        %{type: :king, colour: :black, column: "E", row: 1}
      ]
    }
  end
end
