class Userbookmark < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :bookmark

  # Indirect associations

  # Validations

end
