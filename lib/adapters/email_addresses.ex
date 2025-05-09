defmodule Clerk.Adapters.EmailAddresses do
  @moduledoc """
  Adapter to handle email addresses CRUD
  """

  use Tesla
  import Clerk.Shared.HandleResponse
  alias Clerk.Config

  @behaviour Clerk.Ports.EmailAddresses

  plug(Tesla.Middleware.BaseUrl, Config.domain())

  plug(Tesla.Middleware.Headers, [
    {"Content-Type", "application/json"},
    {"Authorization", "Bearer #{Config.secret_key()}"}
  ])

  plug(Tesla.Middleware.JSON)

  @url "/v1/email_addresses"

  @impl true
  def create(params) do
    @url
    |> post(params)
    |> handle_response()
  end

  @impl true
  def get_id(id), do: "#{@url}/#{id}" |> get() |> handle_response()

  @impl true
  def delete_id(id), do: "#{@url}/#{id}" |> delete() |> handle_response()

  @impl true
  def update(id, params), do: "#{@url}/#{id}" |> patch(params) |> handle_response()
end
