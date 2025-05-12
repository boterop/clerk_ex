defmodule Clerk.Ports.Sessions do
  @moduledoc """
  Behaviour that defines the expected functions for a Sessions adapter. 
  """

  alias Clerk.Shared.HandleResponse

  @callback list() :: HandleResponse.t()
  @callback create(String.t()) :: HandleResponse.t()
  @callback retrieve(String.t()) :: HandleResponse.t()
  @callback refresh(String.t(), map()) :: HandleResponse.t()
  @callback revoke(String.t()) :: HandleResponse.t()
  @callback create_token(String.t(), integer()) :: HandleResponse.t()
  @callback create_from_jwt_template(String.t(), String.t(), integer()) :: HandleResponse.t()
end
