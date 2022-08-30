defmodule ExliveryTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("Name", "email@email.com", "Av Teste, 11 - Centro", "123456789", 19)

      expected_response =
        {:ok,
         %Exlivery.Users.User{
           address: "Av Teste, 11 - Centro",
           age: 19,
           cpf: "123456789",
           email: "email@email.com",
           name: "Name"
         }}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response = User.build("Name", "email@email.com", "Av Teste, 11 - Centro", "123456789", 15)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
