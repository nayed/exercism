test_files = Dir.glob("*/*/*test.rb")
test_files.map do |file|
  system("ruby #{file}")
  return exit(1) if $?.exitstatus > 0 # Exits with "failure" code
end
