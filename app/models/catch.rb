class Catch < ApplicationRecord
  validates :species, presence: true
  validates :email, presence: true
  validates :weight, presence: true, numericality: { only_integer: true } # in grams
  validates :length, presence: true, numericality:{ only_integer: true } #in centimeters
  validates :lang, presence: true, numericality: true
  validates :lat, presence: true, numericality: true

  def create_thumbnails
  end

  handle_asynchronously :create_thumbnails
end
