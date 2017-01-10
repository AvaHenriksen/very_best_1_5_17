class Venue < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :neighborhood

  has_many   :bookmarks,
             :dependent => :destroy

  belongs_to :dish

  # Indirect associations

  has_many   :users,
             :through => :dishes,
             :source => :users

  has_many   :dishes,
             :through => :bookmarks,
             :source => :dish

  # Validations

end
