require 'rubygems'
require 'bundler'
require 'yaml'
require 'logger'
Bundler.require(:default)

#Qwirk.logger = Logger.new($stdout)
file = File.expand_path('../qwirk.yml', __FILE__)
Qwirk.config = YAML.load(ERB.new(File.read(file), nil, '-').result(binding))
$adapter_key = ENV['QWIRK_ADAPTER'] || 'in_memory'

# Cntl-c doesn't run the at_exit hooks in JRuby so allow a kill <pid> to do a graceful shutdown
def jruby_setup_graceful_stop(manager)
  if RUBY_PLATFORM == 'java'
    Signal.trap('TERM') do
      puts "Caught TERM"
      manager.stop
      exit!
    end
  end
end
