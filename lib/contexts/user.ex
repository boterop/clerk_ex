defmodule Clerk.User do
  @moduledoc """
  User context.
  """

  alias Clerk.Adapters.User

  @adapter Application.compile_env(:clerk_ex, :user_adapter, User)

  defdelegate get_id(id), to: @adapter
  defdelegate list(), to: @adapter
  defdelegate create(params), to: @adapter
  defdelegate count(), to: @adapter
  defdelegate update(id, params), to: @adapter

  defdelegate delete_id(id), to: @adapter
  defdelegate ban(id), to: @adapter
  defdelegate unban(id), to: @adapter
  defdelegate lock(id), to: @adapter
  defdelegate unlock(id), to: @adapter

  defdelegate set_profile_image(id, image), to: @adapter
  defdelegate delete_profile_image(id), to: @adapter
  defdelegate merge_and_update_user_metadata(id, metadata), to: @adapter

  defdelegate oauth_access_token(id, provider), to: @adapter
  defdelegate list_memberships(id), to: @adapter
  defdelegate list_invitations(id), to: @adapter
  defdelegate verify_password(id, password), to: @adapter
  defdelegate verify_totp(id, code), to: @adapter
end
