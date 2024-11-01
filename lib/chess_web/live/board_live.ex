defmodule ChessWeb.BoardLive do
  use ChessWeb, :live_view
  import ChessWeb.Components.Board

  alias Chess.Board.Boards

  def mount(_params, _uri, socket) do
    socket =
      socket
      |> assign(:board, Boards.generate())
      |> assign(:square_size, 0)

    {:ok, socket}
  end

  def handle_event("square-size", %{"square_size" => size}, socket) do
    socket = assign(socket, :square_size, size)
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <.board {assigns} />
    """
  end
end
