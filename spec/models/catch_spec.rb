require 'rails_helper'

RSpec.describe Catch, type: :model do
  it { should validate_presence_of(:species) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:weight) }
  it { should validate_presence_of(:length) }
  it { should validate_presence_of(:lang) }
  it { should validate_presence_of(:lat) }

  context ".path_for" do
    it "gives a path for resized photo" do
      katch = create(:catch)
      asset_on_disk = File.join(Rails.root, 'public','uploads', 'catch', 'fish_photo', katch.id.to_s, 'thumb')

      expect(katch.path_for('thumb')).to eq(asset_on_disk)
    end
  end

  context ".thumb" do
    it "creates thumbnail on thumb dir" do
      katch = create(:catch)
      asset_on_disk = File.join(Rails.root, 'public','uploads', 'catch', 'fish_photo', katch.id.to_s, 'thumb', katch.fish_photo.file.filename)

      expect(katch.thumb).to eq(asset_on_disk)
    end
  end

  context ".thumb_url" do
    it "creates thumbnail on thumb dir" do
      katch = create(:catch)

      expect(katch.thumb_url).to eq("/uploads/catch/fish_photo/#{katch.id}/thumb/test.png")
    end
  end
end
