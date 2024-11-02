defmodule ChessWeb.Components.Board do
  use ChessWeb, :html
  import ChessWeb.Components.Pieces

  def board(assigns) do
    ~H"""
    <div
      id="chess-board"
      class="relative board border-4 bg-slate-50 w-full aspect-square grid grid-cols-chess grid-rows-chess rotate-180 -scale-y-100"
      phx-hook="resize"
    >
      <%= for {square, index} <- Enum.with_index(@board) do %>
        <.square
          square={square}
          index={index}
          length={length(@board)}
          selected_piece={@selected_piece}
          coloured={(index + 1) in @coloured_squares}
        />
      <% end %>
      <%= for piece <- @game_state.pieces do %>
        <.piece
          id={piece.id}
          type={piece.type}
          colour={piece.colour}
          column={piece.column}
          row={piece.row}
          size={@square_size}
        />
      <% end %>
    </div>
    """
  end

  def square(assigns) do
    ~H"""
    <div
      class="square flex items-center justify-center"
      style={"order: #{@length - @index};  background-color: #{if(@coloured, do: "var(--moves)")};"}
      id={"square-#{@index + 1}"}
    />
    """
  end
end
