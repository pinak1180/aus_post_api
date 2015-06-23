Dir[(File.dirname(__dir__)) + "/lib/**/*.rb"].each { |f| require f }

# The AusPost class is the main entry point to the gem. It takes a config hash
# that must specify a valid auth key, and request format. Setting the test key
# to true in the config hash will ignore any supplied auth_key and use the test
# endpoint.
class AusPost
  def initialize(config)
    @config = config
  end

  include AusPost::PAC
end
