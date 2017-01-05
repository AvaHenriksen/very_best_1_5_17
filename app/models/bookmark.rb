class Bookmark < ApplicationRecord
  # Direct associations

  has_many   :userbookmarks,
             :dependent => :destroy

  belongs_to :venue

  belongs_to :dish

  # Indirect associations

  # Validations

end
