def run_tests(language, compiler, ending_file)
  underline = `tput smul`
  bold = `tput bold`
  red = `tput setaf 1`
  green = `tput setaf 2`
  reset = `tput sgr0`

  test_files = Dir.glob("#{language}/*/*#{ending_file}")
  test_files.map do |file|
    name = project_name file, ending_file
    system "#{compiler} #{file}"
    if $?.exitstatus > 0
      system "printf '\n#{bold}#{red}#{underline}#{name} test failed.\n'"
      return exit(1) # Exits with "failure" code
    end

    system "printf '\n#{bold}#{green}#{underline}#{name} test finished without error.#{reset}\n\n'"
  end
end

def project_name(file, ending_file)
  file
    .split("/")
    .last
    .chomp(ending_file)
    .scan(/([A-Za-z0-9]+)/)
    .map {|word| word.join.capitalize }
    .join(" ")
end

run_tests "ruby", "ruby", "test.rb"
run_tests "elixir", "elixir", "test.exs"
