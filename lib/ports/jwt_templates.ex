defmodule Clerk.Ports.JWTTemplates do
  @moduledoc """
  behaviour that defines the expected functions for a JWTTemplates adapter.
  """

  alias Clerk.Shared.HandleResponse

  @callback list(map()) :: HandleResponse.t()
  @callback create(map()) :: HandleResponse.t()
  @callback get_id(String.t()) :: HandleResponse.t()
  @callback update(String.t(), map()) :: HandleResponse.t()
  @callback delete(String.t()) :: HandleResponse.t()
end
