defmodule Chess.Board.Boards do
  def generate() do
    letters = ["A", "B", "C", "D", "E", "F", "G", "H"]

    Enum.map(8..1//-1, fn num ->
      Enum.map(letters, fn letter ->
        {letter, num}
      end)
    end)
    |> List.flatten()
  end

  def convert_letters_to_number(letter) do
    case String.upcase(letter) do
      "A" -> 1
      "B" -> 2
      "C" -> 3
      "D" -> 4
      "E" -> 5
      "F" -> 6
      "G" -> 7
      "H" -> 8
    end
  end
end
