defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "123456789"

      {:ok, cpf: cpf}
    end

    test "when  the is found, returns the user", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %Exlivery.Users.User{
           address: "Av Teste, 17 - Centro",
           age: 19,
           cpf: "123456789",
           email: "email@email.com",
           name: "Neander"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("000000000")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
