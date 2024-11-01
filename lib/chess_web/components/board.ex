defmodule ChessWeb.Components.Board do
  use ChessWeb, :html
  import ChessWeb.Components.Pieces

  def board(assigns) do
    ~H"""
    <div
      id="chess-board"
      class="relative board border-4 bg-slate-50 w-full aspect-square grid grid-cols-chess grid-rows-chess"
      phx-hook="resize"
    >
      <%= for square <- @board do %>
        <.square square={square} />
      <% end %>
      <.king column="D" row="8" size={@square_size} />
    </div>
    """
  end

  def square(assigns) do
    ~H"""
    <div class="square flex items-center justify-center"></div>
    """
  end
end
