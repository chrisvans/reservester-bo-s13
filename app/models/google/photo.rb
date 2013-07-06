module Google
  class Photo
    def initialize(resp)
      @resp = resp
    end

    def content_type
      @resp.headers['content-type']
    end

    def body
      @resp.response.body
    end

    def self.find(ref)
      url = "https://maps.googleapis.com/maps/api/place/photo"
      
      resp = HTTParty.get(url, :query => {
        :photoreference => ref, 
        :sensor         => false, 
        :key            => API_KEY,
        :maxwidth       => 400
      })

      return nil unless resp.success?
      resp
    end

  end
end
