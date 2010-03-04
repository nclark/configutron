require 'yaml'
require 'ostruct'
require 'erb'
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
  
  def configutron
    @configutron ||= setup
  end
  
  def setup
    settings_path     = File.expand_path("#{RAILS_ROOT}/config/settings.yml")
    env_settings_path = File.expand_path("#{RAILS_ROOT}/config/settings/#{RAILS_ENV}.yml")
    
    if File.exist?(settings_path)
      @configutron = YAML.load(ERB.new(File.read(settings_path)).result)[RAILS_ENV].symbolize_keys
    elsif File.exists?(env_settings_path)
      @configutron = YAML.load(ERB.new(File.read(env_settings_path)).result).symbolize_keys
    else
      raise IOError, "Create either config/settings.yml or config/settings/RAILS_ENV.yml"
    end
  end
end