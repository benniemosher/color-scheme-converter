require 'yaml'
settings = YAML::load_file(File.join(__dir__, 'theme-settings.yml'))

sample_file = 'textmate/textmate.tmTheme.sample'
new_file = "../#{settings['theme-folder-name']}/textmate/#{settings['theme-filename']}.tmTheme"
sample_file_read = File.read(sample_file)

settings.each do |key, value|
	File.open(new_file, 'w') do |file|
		file.puts sample_file_read.gsub!("{{ #{key} }}", value)
	end
end

def someMethodName(arg1, arg2)
end
