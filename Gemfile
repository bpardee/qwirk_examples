source 'http://rubygems.org'

if ENV['QWIRK_DEV']
  gem 'qwirk', :path => '../qwirk'
  platforms :jruby do
    gem 'qwirk_jms_adapter', :path => '../qwirk_jms_adapter'
    gem 'qwirk_active_mq_adapter', :path => '../qwirk_active_mq_adapter'
  end
else
  gem 'qwirk', '~> 0.1.0'
  gem 'qwirk_active_mq_adapter', '~> 0.1.0', :platforms => :jruby
end
# Allow json and bson marshaling
gem 'json'
gem 'bson'
