defmodule SecretHandshake do
  use Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    commands(code, [])
  end

  defp commands(code, list) when (code &&& 0b1) == 0b1 do
    commands(code ^^^ 0b1, ["wink" | list])
  end

  defp commands(code, list) when (code &&& 0b10) == 0b10 do
    commands(code ^^^ 0b10, ["double blink" | list])
  end

  defp commands(code, list) when (code &&& 0b100) == 0b100 do
    commands(code ^^^ 0b100, ["close your eyes" | list])
  end

  defp commands(code, list) when (code &&& 0b1000) == 0b1000 do
    commands(code ^^^ 0b1000, ["jump" | list])
  end

  defp commands(code, list) when (code &&& 0b10000) == 0b10000 do
    list
  end

  defp commands(_, list) do
    Enum.reverse(list)
  end
end

