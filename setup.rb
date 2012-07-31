# Allow examples to be run in-place without requiring a gem install
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'rubygems'
require 'bundler'
require 'yaml'
require 'logger'
Bundler.require(:default)

#Qwirk.logger = Logger.new($stdout)
file = File.expand_path('../qwirk.yml', __FILE__)
Qwirk.config = YAML.load(ERB.new(File.read(file), nil, '-').result(binding))
$adapter_key = ENV['QWIRK_ADAPTER'] || 'in_memory'
