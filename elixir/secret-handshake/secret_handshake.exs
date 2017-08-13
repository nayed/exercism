defmodule SecretHandshake do
  use Bitwise

  @handshake [{1_000, "jump"}, {100, "close your eyes"}, {10, "double blink"}, {1, "wink"}]

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
    code_bin = code |> Integer.to_string(2) |> String.to_integer

    case check_lower_bits(code_bin) do
      0 ->
        decode([], 0, [], false)
      _ -> 
        {code_bin, reverse} =
          if code_bin >= 10_000 do
            {code_bin - 10_000, true}
          else
            {code_bin, false}
          end

        decode(@handshake, code_bin, [], reverse)
    end
  end
  
  defp decode([], _code, result, reverse) do
    case reverse do
      true -> Enum.reverse result
      _ -> result
    end
  end
  
  defp decode(_shakes, 0, result, reverse), do: decode([], 0, result, reverse)

  defp decode([ {i, shake} | shakes ], code, result, reverse) do
    cond do
      i - code < 0 -> decode(shakes, i, [shake | result], reverse)
      i - code == 0 -> decode(shakes, 0, [shake | result], reverse)
      true -> decode(shakes, code, result, reverse)
    end
  end

  defp check_lower_bits(code) do
    code
    |> Integer.digits
    |> Enum.take(-5)
    |> Enum.count(&(&1 != 0))
  end
end

