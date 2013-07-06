module Google
  class Place
    attr_accessor :photos, :reference

    def initialize(attributes)
      return if attributes.nil?
      attributes = attributes.symbolize_keys

      [:photos, :reference].each do |field|
        self.send("#{field}=", attributes[field])
      end
    end

    def self.find(ref)
      url = "https://maps.googleapis.com/maps/api/place/details/json"
      resp = HTTParty.get(url, :query => {
        :reference => ref,
        :sensor    => false,
        :key       => API_KEY
      })

      return nil unless resp.success? 

      Google::Place.new(
        :reference => ref,
        :photos    => resp['result']['photos'].collect { |p| Rails.application.routes.url_helpers.google_photo_path(p['photo_reference']) }
      )
      
    end

  end
end

