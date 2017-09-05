defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> sanitize
    |> String.split
    |> count_word
  end

  defp count_word(list) do
    Enum.reduce(list, %{}, fn(word, acc) ->
      Map.put(acc, word, Enum.count(list, &(&1 == word)))
    end)
  end

  defp sanitize(string), do: String.replace(string, ~r/[^a-ÿ0-9-]/, " ")
end
