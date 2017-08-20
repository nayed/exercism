def run_tests(language, compiler, ending_file_pattern)
  underline = `tput smul`
  bold = `tput bold`
  red = `tput setaf 1`
  green = `tput setaf 2`
  reset = `tput sgr0`

  test_files = Dir.glob("#{language}/*/#{ending_file_pattern}")
  test_files.map do |file|
    system "#{compiler} #{file}"
    if $?.exitstatus > 0
      system "printf '\n#{bold}#{red}#{underline}#{language.capitalize} test failed.\n'"
      return exit(1) # Exits with "failure" code
    end

    system "printf '\n#{bold}#{green}#{underline}#{language.capitalize} test finished without errors.#{reset}\n\n'"
  end
end

run_tests "ruby", "ruby", "*test.rb"
run_tests "elixir", "elixir", "*test.exs"
