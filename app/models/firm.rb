class Firm < ApplicationRecord
  before_validation :geocode_mappable_address
  
  def geocode_mappable_address
    if self.mappable_address.present?
      require 'open-uri'
      url = URI.parse("http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.mappable_address)}")

      raw_data = url.read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.mappable_address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.mappable_address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.mappable_address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :visits,
             :class_name => "Bookmark",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
