defmodule ChessWeb.Components.Board do
  use Phoenix.Component

  # alias Phoenix.LiveView.JS
  # import ChessWeb.Gettext

  def board(assigns) do
    ~H"""
    <div
      id="chess-board"
      class="relative board border-4 bg-slate-100 w-full aspect-square grid grid-cols-chess grid-rows-chess"
      phx-hook="resize"
    >
      <%= for square <- @board do %>
        <.square square={square} />
      <% end %>
      <div
        class="absolute bg-red-200 aspect-square"
        style={"grid-column: 2; grid-row: 2; width: #{@square_size}px;"}
      >
      </div>
    </div>
    """
  end

  def square(assigns) do
    ~H"""
    <div class="square flex items-center justify-center">
      <p><%= elem(@square, 0) %><%= elem(@square, 1) %></p>
    </div>
    """
  end
end
