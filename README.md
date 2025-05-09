# Clerk Ex

An Elixir library for interacting with the [Clerk API](https://clerk.com/docs/reference/backend-api)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `clerk_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:clerk_ex, "~> 0.1.1"}
  ]
end
```

## Setup

Create/get your [Clerk Secret Key](https://dashboard.clerk.com/).
Add the following to your `config/config.exs`:

```elixir
config :clerk_ex,
  url: "https://api.clerk.com", # optional
  secret: "YOUR_CLERK_SECRET_KEY"
```

## Usage

### User

The real responses from the Clerk API might change over time. To get the most up-to-date information on the structure of the responses, always refer to the [official documentation](https://clerk.com/docs/reference/backend-api/tag/Users).

Example User Response

```json
{
  "id": "user_2wpOgEtHRbyzrrwhHzCC0s44yX7",
  "username": "example_user",
  "created_at": 1746735157117,
  "email_addresses": [],
  "phone_numbers": [],
  "profile_image_url": "https://images.clerk.dev/uploaded/img_2wpUZ5wW02JkorzPghU3aTDwEam",
  "locked": false,
  "banned": false
}
```

- Get a User by ID

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
{:ok, user} = Clerk.User.get_id(user_id)
```

- List All Users

```elixir
{:ok, users} = Clerk.User.list()
```

- Create a New User

```elixir
params = %{
  "username" => "new_user",
  "email" => "<new@example.com>",
  "password" => "secret_password"
}
{:ok, user} = Clerk.User.create(params)
```

- Count users

```elixir
{:ok, %{"total_count" => 1}} = Clerk.User.count
```

- Update a User

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
params = %{
  "username" => "updated_user"
}
{:ok, user} = Clerk.User.update(user_id, params)
```

- Delete a User

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
{:ok, response} = Clerk.User.delete_id(user_id)
```

- Ban a User

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
{:ok, response} = Clerk.User.ban(user_id)
```

- Unban a User

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
{:ok, response} = Clerk.User.unban(user_id)
```

- Lock a User

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
{:ok, response} = Clerk.User.lock(user_id)
```

- Unlock a User

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
{:ok, response} = Clerk.User.unlock(user_id)
```

- Set a User's Profile Image

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
image = "/home/user/Pictures/avatar.jpg"
{:ok, response} = Clerk.User.set_profile_image(user_id, image)
```

- Delete a User's Profile Image

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
{:ok, response} = Clerk.User.delete_profile_image(user_id)
```

- Merge and Update User Metadata

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
metadata = %{
  "new_key" => "new_value"
}
{:ok, response} = Clerk.User.merge_and_update_user_metadata(user_id, metadata)
```

- Get OAuth Access Token

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
provider = "oauth_google"
{:ok, response} = Clerk.User.oauth_access_token(user_id, provider)
```

- List User Memberships

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
{:ok, memberships} = Clerk.User.list_memberships(user_id)
```

- List User Invitations

```elixir

user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
{:ok, invitations} = Clerk.User.list_invitations(user_id)
```

- Verify a User's Password

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
password = "secret_password"
{:ok, response} = Clerk.User.verify_password(user_id, password)
```

- Verify a User's TOTP Code

```elixir
user_id = "user_2wpOgEtHRbyzrrwhHzCC0s44yX7"
code = "123456"
{:ok, response} = Clerk.User.verify_totp(user_id, code)
```

## Email Addresses

The real responses from the Clerk API might change over time. To get the most up-to-date information on the structure of the responses, always refer to the [official documentation](https://clerk.com/docs/reference/backend-api/tag/Email-Addresses).

Example Email Address Response

```json
{
  "id": "string",
  "object": "email_address",
  "email_address": "string",
  "reserved": true,
  "verification": {
    "status": "unverified",
    "strategy": "phone_code",
    "attempts": 0,
    "expire_at": 0,
    "verified_at_client": "string"
  },
  "linked_to": [{}],
  "matches_sso_connection": true,
  "created_at": 0,
  "updated_at": 0
}
```

- Create an email address for a user

```elixir
{:ok, address} = %{
    user_id: "user_2wpOgEtHRbyzrrwhHzCC0s44yX7",
    email_address: "<example@email.com>"
  }
  |> Clerk.EmailAddresses.create()
```

- Retrieve an email address by ID

```elixir
id = "idn_29fk82Jsduewi82938"
{:ok, address} = Clerk.EmailAddresses.get_id(id)
```

- Update an email address by ID

```elixir
id = "idn_29fk82Jsduewi82938"
{:ok, address} =
  Clerk.EmailAddresses.update(id, %{
    verified: true
  })
```

- Delete an email address by ID

```elixir
id = "idn_29fk82Jsduewi82938"
Clerk.EmailAddresses.delete_id(id)
```
