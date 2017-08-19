test_files = Path.wildcard("*/*test.exs")
Enum.map test_files, fn(file) ->
  {result, status} = System.cmd("elixir", [file])
  IO.puts result
  if status > 0, do: System.halt(1)
end
