$:.push File.expand_path("../lib", __FILE__)

require 'bundler/setup'
require 'wowwer'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

Faraday.default_adapter = :test

RSpec.configure do |config|	
	config.before(:all) do
		@stubs = Faraday::Adapter::Test::Stubs.new
		Wowwer.connection = Faraday.new do |faraday|
			faraday.adapter :test, @stubs do |stub|
				stub.get("/api/wow/character/Hyjal/Kylarra") { [200, {}, open(fixture('kylarra.json'))]}
				stub.get("/api/wow/data/character/races") { [200, {}, open(fixture('races.json'))]}
				stub.get("/api/wow/data/character/classes") { [200, {}, open(fixture('classes.json'))]}
			end
		end
	end

  def fixture(filename)
    File.dirname(__FILE__) + '/fixtures/' + filename
  end
end