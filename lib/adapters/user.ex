defmodule Clerk.Adapters.User do
  @moduledoc """
  Adapter to handle users CRUD
  """

  use Tesla
  import Clerk.Shared.HandleResponse
  alias Clerk.Config

  @behaviour Clerk.Ports.User

  plug(Tesla.Middleware.BaseUrl, Config.domain())

  plug(Tesla.Middleware.Headers, [
    {"Content-Type", "application/json"},
    {"Authorization", "Bearer #{Config.secret_key()}"}
  ])

  plug(Tesla.Middleware.JSON)

  @url "/v1/users"

  @impl true
  def get_id(id) do
    "#{@url}/#{id}"
    |> get
    |> handle_response
  end

  @impl true
  def list do
    @url
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
  def count do
    "#{@url}/count"
    |> get()
    |> handle_response()
  end

  @impl true
  def update(id, params) do
    "#{@url}/#{id}"
    |> patch(params)
    |> handle_response()
  end

  @impl true
  def delete_id(id), do: "#{@url}/#{id}" |> delete() |> handle_response()

  @impl true
  def ban(id) do
    "#{@url}/#{id}/ban"
    |> post(%{})
    |> handle_response()
  end

  @impl true
  def unban(id) do
    "#{@url}/#{id}/unban"
    |> post(%{})
    |> handle_response()
  end

  @impl true
  def lock(id) do
    "#{@url}/#{id}/lock"
    |> post(%{})
    |> handle_response()
  end

  @impl true
  def unlock(id) do
    "#{@url}/#{id}/unlock"
    |> post(%{})
    |> handle_response()
  end

  @impl true
  def set_profile_image(id, image_path) do
    file = Tesla.Multipart.new() |> Tesla.Multipart.add_file(image_path)

    "#{@url}/#{id}/profile_image"
    |> post(file)
    |> handle_response
  end

  @impl true
  def delete_profile_image(id) do
    "#{@url}/#{id}/profile_image"
    |> delete()
    |> handle_response
  end

  @impl true
  def merge_and_update_user_metadata(id, metadata) do
    "#{@url}/#{id}/profile_image"
    |> patch(metadata)
    |> handle_response
  end

  @impl true
  def oauth_access_token(id, provider) do
    "#{@url}/#{id}/oauth_access_tokens/#{provider}"
    |> get()
    |> handle_response
  end

  @impl true
  def list_memberships(id) do
    "#{@url}/#{id}/organization_memberships"
    |> get()
    |> handle_response
  end

  @impl true
  def list_invitations(id) do
    "#{@url}/#{id}/organization_invitations"
    |> get
    |> handle_response
  end

  @impl true
  def verify_password(id, password) do
    "#{@url}/#{id}/verify_password"
    |> post(%{password: password})
    |> handle_response
  end

  @impl true
  def verify_totp(id, code) do
    "#{@url}/#{id}/verify_totp"
    |> post(code: code)
    |> handle_response
  end
end
