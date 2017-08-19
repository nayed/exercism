test_files = Dir.glob("*/*test.rb")
test_files.map {|file| system("ruby #{file}")}
