defmodule Clerk.Ports.JWTTemplates do
  @moduledoc """
  Behaviour that defines the expected functions for a JWTTemplates adapter.
  """

  alias Clerk.Shared.HandleResponse

  @callback list() :: HandleResponse.t()
  @callback create(map()) :: HandleResponse.t()
  @callback get_id(String.t()) :: HandleResponse.t()
  @callback update(String.t(), map()) :: HandleResponse.t()
  @callback delete_id(String.t()) :: HandleResponse.t()
end
