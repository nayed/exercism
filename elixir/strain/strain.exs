defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun) do
    process_keep(list, fun, [])
  end

  defp process_keep([], _fun, result), do: Enum.reverse result
  defp process_keep([h | t], fun, result) do
    res = case apply(fun, [h]) do
      true -> [h | result]
      _ -> result
    end
    process_keep(t, fun, res)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    process_discard(list, fun, [])
  end
  
  defp process_discard([], _fun, result), do: Enum.reverse result
  defp process_discard([h | t], fun, result) do
    res = case apply(fun, [h]) do
      false -> [h | result]
      _ -> result
    end
    process_discard(t, fun, res)
  end
end
