class Dish < ApplicationRecord
  # Direct associations

  belongs_to :cuisine

  belongs_to :venue

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
