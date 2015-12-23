require 'yaml'
settings = YAML::load_file(File.join(__dir__, 'theme-settings.yml'))

sample_file = 'textmate/textmate.tmTheme.sample'
sample_file_read = File.read(sample_file)

settings.each do |key, value|
	File.open('textmate/TheOne.tmTheme', 'w') do |file|
		file.puts sample_file_read.gsub!("{{ #{key} }}", value)
	end
end
