defmodule Clerk.Ports.User do
  @moduledoc """
  Behaviour that defines the expected functions for a User adapter.
  """

  alias Clerk.Shared.HandleResponse

  @callback get_id(String.t()) :: HandleResponse.t()
  @callback list() :: HandleResponse.t()
  @callback create(map()) :: HandleResponse.t()
  @callback count() :: HandleResponse.t()
  @callback update(String.t(), map()) :: HandleResponse.t()

  @callback delete_id(String.t()) :: HandleResponse.t()
  @callback ban(String.t()) :: HandleResponse.t()
  @callback unban(String.t()) :: HandleResponse.t()
  @callback lock(String.t()) :: HandleResponse.t()
  @callback unlock(String.t()) :: HandleResponse.t()

  @callback set_profile_image(String.t(), String.t()) :: HandleResponse.t()
  @callback delete_profile_image(String.t()) :: HandleResponse.t()
  @callback merge_and_update_user_metadata(String.t(), map()) :: HandleResponse.t()

  @callback oauth_access_token(String.t(), String.t()) :: HandleResponse.t()
  @callback list_memberships(String.t()) :: HandleResponse.t()
  @callback list_invitations(String.t()) :: HandleResponse.t()
  @callback verify_password(String.t(), String.t()) :: HandleResponse.t()
  @callback verify_totp(String.t(), String.t()) :: HandleResponse.t()
end
