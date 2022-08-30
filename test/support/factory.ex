defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Neander",
      email: "email@email.com",
      address: "Av Teste, 17 - Centro",
      cpf: "123456789",
      age: 19
    }
  end
end
