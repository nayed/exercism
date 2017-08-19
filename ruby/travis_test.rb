test_files = Dir.glob("*/*/*test.rb")
test_files.map do |file|
  system("ruby #{file}")
  if $?.exitstatus > 0
    exit(1) # Exits with "failure" code
  end
end
