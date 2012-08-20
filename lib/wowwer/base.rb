require 'hashie/mash'
require 'wowwer/core_ext/hash'

module Wowwer
  class Base < Hashie::Mash
    def self.get(url, options={})
      options = { region: :us }.merge(options)

      url.gsub!('^/', '')
      request_url = "#{Wowwer.region_uri(options[:region])}/api/wow/#{url}"
      MultiJson.load(Wowwer.connection.get(request_url).body).rubify_keys!
    end
  end
end