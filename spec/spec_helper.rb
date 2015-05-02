require 'vcr'

Dir[(File.dirname(__dir__)) + "/lib/**/*.rb"].each { |f| require f }
Dir[(File.dirname(__dir__)) + "/spec/shared_examples/**/*.rb"].each { |f| require f}

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

def config
  {
    base_uri: 'https://auspost.com.au/api',
    auth_key: 'cd4fcd93-6230-44cb-98ff-3294e281e968'
  }
end

def json_config
  config.merge(format: 'json')
end

def xml_config
  config.merge(format: 'xml')
end

#    base_uri: 'https://test.npe.auspost.com.au',
#    auth_key: '28744ed5982391881611cca6cf5c240',
