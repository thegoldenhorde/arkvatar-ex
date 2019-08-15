defmodule Arkvatar.Client do
  use Tesla
  @moduledoc """
  Documentation for Arkvatar.Client
  """

  plug Tesla.Middleware.Headers, [{"content-type", "application/json"}]
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Timeout, timeout: 5_000

  adapter Tesla.Adapter.Hackney, recv_timeout: 5_000

  @type response :: {:ok, any} | {:error, any}

  @doc """
  Do a GET request and handle the response.

  ## Examples

  iex> Arkvatar.Client.get("https://my.site.com")
  """
  @doc since: "0.1.0"
  @spec get(String.t()) :: response()
  def get(url) do
    get(url)
    |> handle_response
  end

  @doc """
  Do a POST request and handle the response.

  ## Examples

  iex> Arkvatar.Client.post("https://my.site.com", %{key: "value"})
  """
  @doc since: "0.1.0"
  @spec post(String.t(), Map.t()) :: response()
  def post(url, data) do
    post(url, data)
    |> handle_response
  end

  defp handle_response({:ok, %{body: body, status: code}})
  when is_integer(code) and code >= 200 and code < 300 do
    {:ok, body}
  end

  defp handle_response({:ok, %{body: body}}) do
    {:error, body}
  end

  defp handle_response({:error, response}) do
    {:error, response}
  end
end
