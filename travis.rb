require 'fileutils'

module Exercism
  @languages = {
    "ruby" => ["ruby", "test.rb"],
    "elixir" => ["elixir", "test.exs"],
    "ecmascript" => ["./../node_modules/.bin/jest --no-cache", "spec.js"]
  }

  def self.run_tests
    bold, red, blue, reset = `tput bold`, `tput setaf 1`, `tput setaf 4`, `tput sgr0`
    
    @languages.each do |language, tool|
      FileUtils.cd("ecmascript") { system "npm i" if language == "ecmascript" && !self.node_modules?("ecmascript") }
      script, ending_file = tool
      test_files = Dir.glob "#{language}/*/*#{ending_file}"

      unless test_files.empty?
        test_files.map do |file|
          path, test_file = self.project_path file

          FileUtils.cd(path) do
            name = self.project_name(file, ending_file)

            system "#{script} #{test_file}"
            if $?.exitstatus > 0
              system "printf '#{bold}#{red}#{language.capitalize}: #{name} tests failed\n'"
              return exit(1) # Exits with "failure" code
            end
            system "printf '#{bold}#{blue}#{language.capitalize}: #{name} tests finished without error#{reset}\n\n'"
          end
        end
      end
    end
  end

  def self.project_name(file, ending_file)
    file
      .split("/")
      .last
      .chomp(ending_file)
      .scan(/([A-Za-z0-9]+)/)
      .map { |word| word.join.capitalize }
      .join(" ")
  end

  def self.project_path(file)
    f = file.split("/")
    test_file = f.delete_at(2)
    [f.join("/"), test_file]
  end

  def self.node_modules?(path)
    Dir.glob("*").include?("node_modules")
  end
end

Exercism.run_tests
