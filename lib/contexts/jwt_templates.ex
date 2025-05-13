defmodule Clerk.JWTTemplates do
  @moduledoc """
  JWT Templates context.
  """

  @adapter Application.compile_env(:clerk_ex, :jwt_templates_adapter, Clerk.Adapters.JWTTemplates)

  defdelegate list(), to: @adapter
  defdelegate get_id(id), to: @adapter
  defdelegate create(params), to: @adapter
  defdelegate update(id, params), to: @adapter
  defdelegate delete_id(id), to: @adapter
end
