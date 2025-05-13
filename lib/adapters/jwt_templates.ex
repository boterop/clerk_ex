defmodule Clerk.Adapters.JWTTemplates do
  @moduledoc """
    Adapter for JWT templates.
  """

  use Tesla
  import Clerk.Shared.HandleResponse
  alias Clerk.Config

  @behaviour Clerk.Ports.JWTTemplates

  plug(Tesla.Middleware.BaseUrl, Config.domain())

  plug(Tesla.Middleware.Headers, [
    {"Content-Type", "application/json"},
    {"Authorization", "Bearer #{Config.secret_key()}"}
  ])

  plug(Tesla.Middleware.JSON)

  @url "/v1/jwt_templates"

  @impl true
  def list() do
    @url
    |> get()
    |> handle_response()
  end

  @impl true
  def get_id(id) do
    "#{@url}/#{id}"
    |> get()
    |> handle_response()
  end

  @impl true
  def create(params) do
    @url
    |> post(params)
    |> handle_response()
  end

  @impl true
  def update(id, params) do
    "#{@url}/#{id}"
    |> patch(params)
    |> handle_response()
  end

  @impl true
  def delete_id(id) do
    "#{@url}/#{id}"
    |> delete()
    |> handle_response()
  end
end
