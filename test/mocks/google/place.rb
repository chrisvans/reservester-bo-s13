require 'google/place'
module Google
  class Place
    class << self
      def set_default_expectations!
        Google::Place.expects(:find).at_least(0).returns(nil)
      end

      def factory(attributes={})
        @next_id ||= 0
        @next_id += 1
        attributes[:reference] ||= @next_id 

        place = Google::Place.new(valid_attributes(attributes))
        Google::Place.expects(:find).with(attributes[:reference]).at_least(0).returns(place)

        place
      end

      def valid_attributes(attributes={})
        {
          :photos => [ '/google/photos/1' ]
        }.merge(attributes.symbolize_keys)
      end
    end
  end
end


class ActiveSupport::TestCase
  setup do
    Google::Place.set_default_expectations!
  end
end
