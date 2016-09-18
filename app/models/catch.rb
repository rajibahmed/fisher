require 'carrierwave/orm/activerecord'

class Catch < ApplicationRecord
  validates :species, presence: true
  validates :email, presence: true
  validates :weight, presence: true, numericality: { only_integer: true } # in grams
  validates :length, presence: true, numericality:{ only_integer: true } #in centimeters
  validates :lang, presence: true, numericality: true
  validates :lat, presence: true, numericality: true

  mount_uploader :fish_photo, PhotoUploader

  def thumb
  end

  def large
  end

  def create_images
  end

  handle_asynchronously :create_images
end
