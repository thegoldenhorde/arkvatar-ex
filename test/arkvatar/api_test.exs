defmodule Arkvatar.ApiTest do
  use ExUnit.Case
  import Tesla.Mock

  setup do
    mock fn
      %{method: :get, url: "https://arkvatar.com/api/"} ->
        %Tesla.Env{status: 200, body: %{ identifier: "dummyIdentifier@gmail.com" }}
      %{method: :post, url: "https://arkvatar.com/api/verify"} ->
        %Tesla.Env{status: 200, body: %{ identifier: "dummyIdentifier@gmail.com" }}
      %{method: :post, url: "https://arkvatar.com/api/store"} ->
        %Tesla.Env{status: 200, body: %{ identifier: "dummyIdentifier@gmail.com" }}
    end
    :ok
  end

  test "show" do
    assert {:ok, %Tesla.Env{} = env} = Arkvatar.Api.show("azerty@gmail.com")
    assert env.status == 200
  end

  test "verify" do
    assert {:ok, %Tesla.Env{} = env} = Arkvatar.Api.verify("azerty@gmail.com")
    assert env.status == 200
  end

  test "post" do
    assert {:ok, %Tesla.Env{} = env} = Arkvatar.Api.store(%{type: "Email", identifier: "azerty@gmail.com"})
    assert env.status == 200
  end
end
