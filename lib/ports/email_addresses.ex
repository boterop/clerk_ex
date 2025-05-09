defmodule Clerk.Ports.EmailAddresses do
  @moduledoc """
  Behaviour that defines the expected functions for the email addresses adapter.
  """

  alias Clerk.Shared.HandleResponse

  @callback create(map()) :: HandleResponse.t()
  @callback get_id(String.t()) :: HandleResponse.t()
  @callback delete_id(String.t()) :: HandleResponse.t()
  @callback update(String.t(), map()) :: HandleResponse.t()
end
