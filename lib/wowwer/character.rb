require 'wowwer/base'
require 'wowwer/race'
require 'wowwer/character_class'

module Wowwer
  class Character < Wowwer::Base
    def self.fetch(params = {})
      params.stringify_keys!

      region = params['region'] || Wowwer.default_region
      realm = params['realm']
      name = params['name']
      # fields = params['fields'] || []

      request_uri = "character/#{realm}/#{name}"
      # request_uri += "?fields=#{fields}" unless fields.empty?
      new get(request_uri, {region: region}).merge({region: region})
    end

    def last_modified
      Time.at(self['last_modified'] / 1000)
    end

    def race
      @race ||= Race.find(self['race'], region: region)
    end

    def thumbnail_url
      "#{Wowwer.region_uri(region)}/static-render/#{region}/#{thumbnail}"
    end

    def character_class
      @klass ||= CharacterClass.find(self['class'], region: region)
    end
    alias :klass :character_class
  end
end