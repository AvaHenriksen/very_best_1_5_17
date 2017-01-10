class Dish < ApplicationRecord
  # Direct associations

  belongs_to :cuisine

  has_many   :locations,
             :class_name => "Venue",
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :bookmarks,
             :source => :user

  has_many   :venues,
             :through => :bookmarks,
             :source => :venue

  # Validations

end
