defmodule Conduit.Accounts.Events.UserRegistered do
    @derive [Posion.Encoder]
    defstruct [
        :user_uuid,
        :username,
        :email,
        :hashed_password,
    ]
end