defmodule Conduit.Auth do
    @moduledoc """
    Auth using the bcrypt hashing fn
    """

    alias Comeonin.Bcrypt

    def hash_password(password), do: Bcrypt.hashpwsalt(password)
    def validate_password(password, hash), do: Bcrypt.checkpw(password, hash)
end