defmodule TwelveDays do
  @christmas_presents %{
    1 => {"first", "a Partridge in a Pear Tree"},
    2 => {"second", "two Turtle Doves"},
    3 => {"third", "three French Hens"},
    4 => {"fourth", "four Calling Birds"},
    5 => {"fifth", "five Gold Rings"},
    6 => {"sixth", "six Geese-a-Laying"},
    7 => {"seventh", "seven Swans-a-Swimming"},
    8 => {"eighth", "eight Maids-a-Milking"},
    9 => {"ninth", "nine Ladies Dancing"},
    10 => {"tenth", "ten Lords-a-Leaping"},
    11 => {"eleventh", "eleven Pipers Piping"},
    12 => {"twelfth", "twelve Drummers Drumming"}
  }

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    {numth, _} = @christmas_presents[number]
    construct_verse(number, numth, "")
  end

  defp construct_verse(0, numth, presents), do:
    "On the #{numth} day of Christmas my true love gave to me, #{presents}."
  
  defp construct_verse(1, numth, presents) do
    add_and = if String.length(presents) > 0 do
      "and "
    else
      ""
    end
    construct_verse(0, numth, presents <> add_and <> get_present(1))
  end

  defp construct_verse(number, numth, presents), do:
    construct_verse(number - 1, numth, presents <> get_present(number) <> ", ")

  defp get_present(number) do
    {_, present} = @christmas_presents[number]
    present
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    for number <- starting_verse..ending_verse do
      verse(number)
    end
    |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing do
    verses(1, 12)
  end
end
