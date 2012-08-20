module Wowwer
  class CharacterClass < Wowwer::Base
    class << self
      def all(options={})
        @classes ||= get("data/character/classes", options)['classes'].map do |klass|
          new klass
        end
      end

      def find(id, options={})
        all(options).detect{|c| c.id == id }
      end

      def find_by_name(name, options={})
        all(options).detect{|c| c.name.downcase == name.downcase }
      end
    end
  end
end