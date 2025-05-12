defmodule Clerk.Sessions do
  @moduledoc """
  Session context.
  """
  @adapter Application.compile_env(:clerk_ex, :session_adapter, Clerk.Adapters.Sessions)

  defdelegate list(params), to: @adapter
  defdelegate create(user_id), to: @adapter
  defdelegate retrieve(id), to: @adapter
  defdelegate refresh(id, params), to: @adapter
  defdelegate revoke(id), to: @adapter
  defdelegate create_token(id, expires_in \\ nil), to: @adapter
  defdelegate create_from_jwt_template(id, template, expires_in \\ nil), to: @adapter
end
