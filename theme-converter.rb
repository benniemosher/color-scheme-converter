require 'yaml'
settings = YAML::load_file(File.join(__dir__, 'theme-settings.yml'))

sample_files = [
  'textmate/textmate.tmTheme.sample',
  'terminator/config.sample'
]

sample_files.each do |sample_file|
  new_file = "../#{settings['theme-folder-name']}/#{sample_file.gsub('.sample', '').gsub('/textmate', '/' + settings['theme-filename'])}"

  sample_file_read = File.read(sample_file)

  File.open(new_file, 'w') do |file|
    settings.each do |key, value|
      sample_file_read.gsub!("{{ #{key} }}", value)
    end

    file.write(sample_file_read)
  end
end
