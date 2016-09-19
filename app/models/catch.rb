require 'RMagick'

class Catch < ApplicationRecord
  validates :species, presence: true
  validates :email, presence: true
  validates :fish_photo, presence: true
  validates :weight, presence: true, numericality: { only_integer: true } # in grams
  validates :length, presence: true, numericality:{ only_integer: true } #in centimeters
  validates :lang, presence: true, numericality: true
  validates :lat, presence: true, numericality: true

  THUMB = {height: 100, width: 100}
  LARGE = {height: 140, width: 140}

  mount_uploader :fish_photo, PhotoUploader

  def thumb_url
    url('thumb')
  end

  def large_url
    url('large')
  end

  def url(photo_type)
    ['/uploads', model_name.name.downcase, 'fish_photo',
     id.to_s, photo_type, fish_photo.file.filename].join('/')
  end

  def thumb
    File.join(path_for("thumb"), fish_photo.file.filename)
  end

  def large
    File.join(path_for("large"), fish_photo.file.filename)
  end

  def create_images
    %w(thumb large).each do |name|
      mkdir_for(name)
      process(name)
    end
  end

  handle_asynchronously :create_images

  def path_for(photo_type)
    File.join(photo_basepath, photo_type)
  end

  def photo_basepath
    File.dirname(fish_photo.path)
  end

  def mkdir_for(photo_type)
    FileUtils.mkdir_p(path_for(photo_type))
  end

  def process(name)
    dimension = dimension_for(name)
    img = Magick::Image.read(fish_photo.path).first
    img.resize(dimension[:height], dimension[:width]).
      write(send(name.to_sym))
  end

  def dimension_for(photo_type)
    case photo_type
    when "thumb"
      return THUMB
    when "large"
      return LARGE
    end
  end

  def as_json(options)
    super.merge(fish_photo:{ url: fish_photo.url, thumb_url: thumb_url, large_url: large_url})
  end
end
