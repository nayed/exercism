defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist
    |> process(shift, [])
  end

  defp process([], _shift, result), do: result |> Enum.reverse |> List.to_string

  defp process([h | t], shift, result) when h + shift > ?z do
    process(t, shift, [<<h + shift - ?z + ?a - 1>> | result])
  end

  defp process([h | t], shift, result) when h + shift > ?Z and h < ?a do
    process(t, shift, [<<h + shift - ?Z + ?A - 1>> | result])
  end

  defp process([h | t], shift, result) when h >= ?a and h <= ?z or h >= ?A and h <= ?Z do
    process(t, shift, [<<h + shift>> | result])
  end

  defp process([h | t], shift, result) do
    process(t, shift, [h | result])
  end
end
