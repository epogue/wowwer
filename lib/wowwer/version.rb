module Wowwer
  class Version
    MAJOR = 0 unless defined? Wowwer::MAJOR
    MINOR = 1 unless defined? Wowwer::MINOR
    PATCH = 0 unless defined? Wowwer::PATCH
    PRE = nil unless defined? Wowwer::PRE

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end
    end
  end
end