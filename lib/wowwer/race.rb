module Wowwer
  class Race < Wowwer::Base
    class << self
      def all(options={})
        @races ||= get("data/character/races", options)['races'].map do |race|
          new race
        end
      end

      def find(id, options={})
        all(options).detect{|r| r.id == id }
      end

      def find_by_name(name, options={})
        all(options).detect{|r| r.name.downcase == name.downcase }
      end
    end
  end
end