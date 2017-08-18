defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun) do
    process(:keep, list, fun, [])
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    process(:discard, list, fun, [])
  end
  
  defp process(_action, [], _fun, result), do: result
  defp process(action, [h | t], fun, result) do
    case { action, apply(fun, [h]) } do
      {:keep, true}     -> process(action, t, fun, result ++ [h])
      {:discard, false} -> process(action, t, fun, result ++ [h])
      _                 -> process(action, t, fun, result)
    end
  end
end
