class Angler < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
