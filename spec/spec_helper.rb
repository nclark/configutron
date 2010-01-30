$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'configutron'
require 'spec'
require 'spec/autorun'

require 'rubygems'
require 'active_support'