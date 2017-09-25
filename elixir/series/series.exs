defmodule StringSeries do
  defmacro s_length(s) do
    quote do: String.length(unquote(s))
  end
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    cond do
      size > s_length(s) or size < 1 ->
        []
      true ->
        new_s = s |> String.graphemes
        new_s = new_s -- [List.first(new_s)]
        new_s = to_string(new_s)
        [String.slice(s, 0..size-1) | slices(new_s, size)]
    end
  end
end
