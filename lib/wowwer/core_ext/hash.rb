require 'hashie/hash_extensions'
require 'wowwer/core_ext/string'

class Hash
  include Hashie::HashExtensions

  def rubify_keys!
    keys.each{|k|
      v = delete(k)
      new_key = k.to_s.underscore
      self[new_key] = v
      v.rubify_keys! if v.is_a?(Hash)
      v.each{|p| p.rubify_keys! if p.is_a?(Hash)} if v.is_a?(Array)
    }
    self
  end
end