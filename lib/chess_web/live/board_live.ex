defmodule ChessWeb.BoardLive do
  use ChessWeb, :live_view
  import ChessWeb.Components.Board

  alias Chess.Board.Boards
  alias Chess.Game.Games

  def mount(_params, _uri, socket) do
    game_state =
      Games.generate_game_start_state()
      |> Games.generate_possible_moves()

    socket =
      socket
      |> assign(:square_size, 0)
      |> assign(:selected_piece, nil)
      |> assign(:coloured_squares, [])
      |> assign(:board, Boards.generate())
      |> assign(:game_state, game_state)

    {:ok, socket}
  end

  def handle_event("show_moves", %{"id" => id}, socket) do
    %{pieces: pieces} = socket.assigns.game_state

    piece =
      Enum.find(pieces, fn piece ->
        String.to_integer(id) == piece.id
      end)

    coloured_squares =
      Enum.map(piece.moves, fn %{row: row, column: column} ->
        (row - 1) * 8 + column
      end)

    socket =
      socket
      |> assign(:selected_piece, piece)
      |> assign(:coloured_squares, coloured_squares)

    {:noreply, socket}
  end

  def handle_event("square-size", %{"square_size" => size}, socket) do
    socket = assign(socket, :square_size, size)
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="my-auto">
      <.board {assigns} />
    </div>
    """
  end
end
