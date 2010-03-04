$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'configutron'
require 'spec'
require 'spec/autorun'

require 'rubygems'
require 'active_support'
require 'fakefs/spec_helpers'

def mock_test_yml
  FileUtils.mkdir_p('/rails_root/config/settings')
  File.open('/rails_root/config/settings/test.yml', 'w') do |f|
    f.puts <<-END_SETTINGS
    file: test.yml
    
    some_variable: some value

    my_string: string

    my_integer: 1

    my_array:
      - 1
      - 2
      - 3
      - 4

    my_hash:
      one: 1
      two: 2

    two:
      three: 3

    four:
      five:
        six: 6
END_SETTINGS
    
    Configutron.stub!(:settings_path).and_return("/rails_root/config/settings/test.yml")
  end
end