require 'rails_helper'

RSpec.describe Catch, type: :model do
  it { should validate_presence_of(:species) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:weight) }
  it { should validate_presence_of(:length) }
  it { should validate_presence_of(:lang) }
  it { should validate_presence_of(:lat) }
end
