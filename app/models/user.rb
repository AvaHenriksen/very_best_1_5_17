class User < ApplicationRecord
  # Direct associations

  has_many   :userbookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :bookmarks,
             :through => :userbookmarks,
             :source => :bookmark

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
