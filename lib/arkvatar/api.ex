defmodule Arkvatar.Api do
  import Arkvatar.Client

  @moduledoc """
  Documentation for Arkvatar.Api
  """

  @doc """
  Show the Arkvatar matching the given identifier. Identifier can be a crypto or email address.

  ## Examples

      iex> Arkvatar.Api.show('validIdentifier')
      :ok
  """
  @doc since: "1.0.0"
  @spec verify(String.t()) :: Arkvatar.Client.response()
  def show(identifier) do
    get("https://arkvatar.com/api/#{identifier}")
  end

  @doc """
  Verify the given identifier. Identifier can be a crypto or email address.

  ## Examples

      iex> Arkvatar.Api.verify('validIdentifier')
      :ok
  """
  @doc since: "1.0.0"
  @spec verify(String.t()) :: Arkvatar.Client.response()
  def verify(identifier) do
    post("https://arkvatar.com/api/verify", %{identifier: identifier})
  end

  @doc """
  Create an Arkvatar from the given data.

  ## Examples

  # Without specifying the type or any other parameters
  iex> Arkvatar.Api.store(%{identifier: 'validIdentifier'})

  # With type and parameters
  iex> Arkvatar.Api.store(%{type: 'validType', identifier: 'validIdentifier', qr_code: bool, vertical_gradient: bool, no_background: bool})
  """
  @doc since: "1.0.0"
  @spec store(Map.t()) :: Arkvatar.Client.response()
  def store(data) when is_map(data) do
    post("https://arkvatar.com/api/store", %{
      type: data.type,
      identifier: data.identifier,
      qr_code: (if Map.has_key?(data, :qr_code), do: true, else: false),
      vertical_gradient: (if Map.has_key?(data, :vertical_gradient), do: true, else: false),
      no_background: (if Map.has_key?(data, :no_background), do: true, else: false)
      })
  end
end
