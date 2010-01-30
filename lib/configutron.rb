require 'yaml'
require 'ostruct'
require 'core_ext'

module Configutron
  extend self
    
  def constant=(name)
    Kernel.const_set(name, Configutron)
  end

  private
  def method_missing(key)
    configutron[key].to_openstruct || nil
  end

  def settings_path
    File.expand_path("#{RAILS_ROOT}/config/settings/#{RAILS_ENV}.yml")
  end
  
  def configutron
    @configutron ||= YAML.load_file(settings_path).symbolize_keys
  end
end