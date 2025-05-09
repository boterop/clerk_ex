defmodule Clerk.EmailAddresses do
  @moduledoc """
  Email Addresses context.
  """

  alias Clerk.Adapters.EmailAddresses

  @adapter Application.compile_env(:clerk_ex, :email_addresses_adapter, EmailAddresses)

  defdelegate create(params), to: @adapter
  defdelegate get_id(id), to: @adapter
  defdelegate delete_id(id), to: @adapter
  defdelegate update(id, params), to: @adapter
end
