defmodule ProteinTranslation do
  @codons %{
    "UGU" => "Cysteine", "UGC" => "Cysteine", "UUA" => "Leucine",
    "UUG" => "Leucine", "AUG" => "Methionine", "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine", "UCU" => "Serine", "UCC" => "Serine",
    "UCA" => "Serine", "UCG" => "Serine", "UGG" => "Tryptophan",
    "UAU" => "Tyrosine", "UAC" => "Tyrosine", "UAA" => "STOP",
    "UAG" => "STOP", "UGA" => "STOP",
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    codons = rna |> String.graphemes |> Enum.chunk_every(3)
    proteins = for c <- codons do
      case c |> List.to_string |> of_codon do
        {:ok, protein} -> {:ok, protein}
        {:error, msg} -> {:error, msg}
      end
    end
    cond do
      Keyword.has_key?(proteins, :error) == true ->
        {:error, "invalid RNA"}
      true ->
        {:ok, Keyword.values(proteins) |> Enum.take_while(fn(x) -> x != "STOP" end)}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    case Map.fetch(@codons, codon) do
      {:ok, protein} -> {:ok, protein}
      :error -> {:error, "invalid codon"}
    end
  end
end
