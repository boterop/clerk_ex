defmodule Clerk.Adapters.Sessions do
  @moduledoc """
  Adapter to handle sessions endpoints
  """

  use Tesla
  import Clerk.Shared.HandleResponse
  alias Clerk.Config

  @behaviour Clerk.Ports.Sessions

  plug(Tesla.Middleware.BaseUrl, Config.domain())

  plug(Tesla.Middleware.Headers, [
    {"Content-Type", "application/json"},
    {"Authorization", "Bearer #{Config.secret_key()}"}
  ])

  plug(Tesla.Middleware.JSON)

  @url "/v1/sessions"

  @impl true
  def list(params) do
    @url
    |> get()
    |> handle_response()
  end

  @impl true
  def create(user_id) do
    @url
    |> post(%{"user_id" => user_id})
    |> handle_response()
  end

  @impl true
  def retrieve(id) do
    "#{@url}/#{id}"
    |> get()
    |> handle_response()
  end

  @impl true
  def refresh(id, params) do
    "#{@url}/#{id}/refresh"
    |> post(params)
    |> handle_response()
  end

  @impl true
  def revoke(id) do
    "#{@url}/#{id}/revoke"
    |> post()
    |> handle_response()
  end

  @impl true
  def create_token(id, expires_in) do
    "#{@url}/#{id}/token"
    |> post(%{"expires_in_seconds" => expires_in})
    |> handle_response()
  end

  @impl true
  def create_from_jwt_template(id, template_name, expires_in) do
    "#{@url}/#{id}/tokens/#{template_name}"
    |> post(%{"expires_in_seconds" => expires_in})
    |> handle_response()
  end
end
