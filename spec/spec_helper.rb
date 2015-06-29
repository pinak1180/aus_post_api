require 'vcr'
require 'json'
require 'require_all'

require_all 'lib'

Dir[(File.dirname(__dir__)) + "/spec/shared_examples/**/*.rb"].each { |f| require f}

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

def config
  # This uses a live endpoint. The key used is not used in any production
  # environments. The test endpoint is broken...
  {
    TEST: false,
    PAC_AUTH_KEY: 'f9c917c2-33bf-468b-824a-6739702505f9'
  }
end

def json_config
  config.merge(FORMAT: 'json')
end

def xml_config
  config.merge(FORMAT: 'xml')
end

