require 'faraday'
require 'multi_json'

require 'wowwer/character'
require 'wowwer/version'

module Wowwer
  REGIONS = {
    us: {
      base_uri: 'us.battle.net'
    }
  }

  def self.connection
    @connection ||= Faraday.new
  end

  def self.connection=(connection)
    @connection = connection
  end

  def self.default_region
    @default_region ||= :us
  end

  def self.default_region=(region)
    @default_region = region
  end

  def self.region_uri(region = Wowwer.default_region)
    'https://' + REGIONS[region][:base_uri]
  end
end