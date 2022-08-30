defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

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

  def order_factory do
    %Order{
      delivery_address: "Av Teste, 17 - Centro",
      items: [
        build(:item),
        build(:item,
          description: "Hamburguer",
          category: :hamburguer,
          unity_price: Decimal.new("5"),
          quantity: 3
        )
      ],
      total_price: Decimal.new("40.50"),
      user_cpf: "123456789"
    }
  end
end
