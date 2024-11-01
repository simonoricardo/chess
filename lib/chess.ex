defmodule Chess do
  def context do
    quote do
      use Gettext, backend: Chess.Gettext
      import Ecto.Query

      alias Chest.Repo
    end
  end

  def schema do
    quote do
      use Accessible
      use Gettext, backend: Chest.Gettext

      alias Chest.Repo
      use Ecto.Schema
      import Ecto.Changeset

      alias __MODULE__
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
