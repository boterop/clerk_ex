defmodule Clerk.Config do
  @moduledoc """
  Application configuration.
  """

  def domain do
    Application.get_env(:clerk_ex, :url) || System.get_env("CLERK_API_URL") ||
      "https://api.clerk.com"
  end

  def secret_key do
    Application.get_env(:clerk_ex, :secret) || System.get_env("CLERK_SECRET_KEY") ||
      raise("Missig Clerk Secret Key")
  end
end
