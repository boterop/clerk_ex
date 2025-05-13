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

  def handle_response({:error, reason}) do
    {:errors, [reason]}
  end

  def handle_response(_) do
    {:errors, :internal_error}
  end

  def set_query_params(url, params) do
    params
    |> URI.encode_query()
    |> set_to_url(url)
  end

  @spec set_to_url(String.t(), String.t()) :: String.t()
  defp set_to_url("", url), do: url

  defp set_to_url(params, url) do
    case String.ends_with?(url, "/") do
      true ->
        String.trim_trailing(url, "/") <> "?#{params}"

      false ->
        "#{url}?#{params}"
    end
  end
end
