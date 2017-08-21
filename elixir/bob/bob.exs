defmodule Bob do
  def hey(input) do
    cond do
      String.last(input) == "?" ->
        "Sure."
      input |> String.trim |> String.length == 0 ->
        "Fine. Be that way!"
      String.upcase(input) == input and String.downcase(input) != input ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end
end
