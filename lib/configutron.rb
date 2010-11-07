require 'yaml'
require 'ostruct'
require 'erb'

require File.expand_path(File.join(File.dirname(__FILE__), 'configutron', 'core_ext'))

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
    settings_path     = File.expand_path(Rails.root.join('config', 'settings.yml'))
    env_settings_path = File.expand_path(Rails.root.join('config', 'settings', "#{Rails.env}.yml"))
    
    if File.exist?(settings_path)
      @configutron = YAML.load(ERB.new(File.read(settings_path)).result)[Rails.env].symbolize_keys
    elsif File.exists?(env_settings_path)
      @configutron = YAML.load(ERB.new(File.read(env_settings_path)).result).symbolize_keys
    else
      raise IOError, "Create either config/settings.yml or config/settings/RAILS_ENV.yml"
    end
  end
end