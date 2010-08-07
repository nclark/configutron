$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'configutron'
require 'spec'
require 'spec/autorun'
require 'fake_yml_files'
require 'pathname'

require 'rubygems'
require 'fakefs/spec_helpers'

begin
  require 'active_support/hash_with_indifferent_access'
rescue LoadError
  require 'active_support'
end

def mock_test_yml
  path = '/rails_root/config/settings/test.yml'
  
  FileUtils.mkdir_p('/rails_root/config/settings')
  File.open(path, 'w') do |f|
    f.puts TEST_YML
  end
end

def mock_settings_yml
  FileUtils.mkdir_p('/rails_root/config')
  File.open('/rails_root/config/settings.yml', 'w') do |f|
    f.puts SETTINGS_YML
  end
end

def reset!
  FileUtils.rm_rf('/rails_root')
  
  Configutron.instance_eval do
    @configutron = nil
  end
end

module Rails
  def self.root
    @root ||= Pathname.new('/rails_root')
  end
  
  def self.env
    'test'
  end
end