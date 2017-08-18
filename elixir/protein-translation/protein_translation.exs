defmodule ProteinTranslation do
  @codons [ UGU: "Cysteine", UGC: "Cysteine", UUA: "Leucine",
            UUG: "Leucine", AUG: "Methionine", UUU: "Phenylalanine",
            UUC: "Phenylalanine", UCU: "Serine", UCC: "Serine",
            UCA: "Serine", UCG: "Serine", UGG: "Tryptophan",
            UAU: "Tyrosine", UAC: "Tyrosine",
            UAA: "STOP", UAG: "STOP", UGA: "STOP" ]

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    arr = String.split rna, "", trim: true
    codons = construct_codons(arr, [])
    proteins = Enum.map(codons, fn(x) ->
      case of_codon(x) do
        {:ok, protein} -> protein
        {:error, _} -> :error
      end
    end)
    check_proteins(proteins)
  end
  
  defp construct_codons([], list), do: list
  defp construct_codons(rna, list) do
    codon = Enum.take(rna, 3)
    construct_codons(rna -- codon, list ++ [List.to_string(codon)])
  end

  defp check_proteins(list) do
    proteins = Enum.take_while(list, fn(x) -> x != "STOP" end)
    is_list_of_prot = Enum.any?(proteins, fn(x) -> x != :error end)
    case is_list_of_prot do
      true -> {:ok, proteins}
      false -> {:error, "invalid RNA"}
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
    case Keyword.has_key?(@codons, String.to_atom codon) do
      true -> {:ok, Keyword.get(@codons, String.to_atom codon)}
      false -> {:error, "invalid codon"}
    end
  end
end
