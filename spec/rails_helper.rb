# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'vcr'
require 'webmock/rspec'
# Add additional requires below this line. Rails is not loaded until this point!

RSpec.configure do |config|

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.after(:each) do
    DatabaseCleaner.clean

  config.include FactoryGirl::Syntax::Methods
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { :record => :new_episodes }
end
