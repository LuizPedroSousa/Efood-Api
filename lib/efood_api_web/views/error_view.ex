defmodule EfoodApiWeb.ErrorView do
  use EfoodApiWeb, :view
  alias Ecto.Changeset
  import Ecto.Changeset, only: [traverse_errors: 2]
  alias Ecto.Changeset

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("400.json", %{result: %Changeset{} = changeset}) do
    %{errors: translate_errors(changeset)}
  end

  def render("400.json", %{result: details}) do
    %{
      error: %{
        details: details
      }
    }
  end

  defp translate_errors(changeset) do
    changeset
    |> traverse_errors(fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
