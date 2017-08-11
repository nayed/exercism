defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """

  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    count(strand, nucleotide, 0)
  end
  
  defp count([], _, i), do: i
  defp count([h | t], char, i) do
    i = 
      if h == char do
        i + 1
      else
        i
      end
    count(t, char, i)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.into(@nucleotides, %{}, &({&1, count(strand, &1)}))
  end
end
