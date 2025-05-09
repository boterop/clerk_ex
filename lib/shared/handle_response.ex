defmodule Clerk.Shared.HandleResponse do
  @moduledoc """
    Function to handle Clerk API responses
  """

  @type ok :: {:ok, any()}
  @type errors :: {:errors, list()}
  @type t :: ok | errors

  @spec handle_response({:ok, Tesla.Env.t()}) :: t
  def handle_response({:ok, %Tesla.Env{status: status, body: body}})
      when status >= 200 and status < 300 do
    {:ok, body}
  end

  def handle_response({:ok, %Tesla.Env{body: %{"errors" => reasons}}}) do
    {:errors, reasons}
  end

  def handle_response({:ok, %Tesla.Env{body: reason}}) do
    {:errors, [reason]}
  end

  def handle_response(_) do
    {:errors, :internal_error}
  end
end
