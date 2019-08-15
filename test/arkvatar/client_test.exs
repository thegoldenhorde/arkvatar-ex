defmodule Arkvatar.ClientTest do
  use ExUnit.Case
  import Tesla.Mock

  setup do
    mock fn
      %{method: :get, url: "https://jsonplaceholder.typicode.com/posts/1"} ->
        %Tesla.Env{status: 200, body: %{ id: "1" }}
      %{method: :post, url: "https://jsonplaceholder.typicode.com/posts"} ->
        %Tesla.Env{status: 200, body: %{ body: "dummyCreatedBody" }}
    end
    :ok
  end

  test "get" do
    assert {:ok, %Tesla.Env{} = env} = Arkvatar.Client.get("https://jsonplaceholder.typicode.com/posts/1")
    assert env.status == 200
  end

  test "post" do
    assert {:ok, %Tesla.Env{} = env} = Arkvatar.Client.post("https://jsonplaceholder.typicode.com/posts", %{title: "test", body: "dummyCreatedBody", userId: 1})
    assert env.status == 201
  end
end
