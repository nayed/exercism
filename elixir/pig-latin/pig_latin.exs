defmodule PigLatin do
  @vowels ~w(a e i o u yt xr)
  @supplement_consonants ~r(ch|qu|squ|thr|th|sch|[^aeiou])

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split
    |> Enum.map(fn(word) ->
      cond do
        String.starts_with?(word, @vowels) ->
          word <> "ay"
        true ->
          [consonant, rest] = String.split(word, @supplement_consonants, include_captures: true, trim: true, parts: 2)
          rest <> consonant <> "ay"
      end
    end)
    |> Enum.join(" ")
  end
end
