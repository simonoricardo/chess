defmodule Chess.Board.Boards do
  def generate() do
    letters = ["A", "B", "C", "D", "E", "F", "G", "H"]

    Enum.map(8..1, fn num ->
      Enum.map(letters, fn letter ->
        {letter, num}
      end)
    end)
    |> List.flatten()
  end
end
