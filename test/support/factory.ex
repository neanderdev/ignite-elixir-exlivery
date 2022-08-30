defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  def user_factory do
    %User{
      name: "Neander",
      email: "email@email.com",
      address: "Av Teste, 17 - Centro",
      cpf: "123456789",
      age: 19
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de frango",
      category: :pizza,
      unity_price: Decimal.new("25.5"),
      quantity: 1
    }
  end
end
