require 'rails_helper'

describe Errors do
  context 'Unknown errors' do
    it 'produces the fallback hash' do
      err = { code: 1, message: 'unknown error' }
      expect(Errors.for(:undefined_error_identifier)).to eq(err)
    end
  end

  context 'Known errors' do
    it 'produces expected hash' do
      err = { code: 1000, message: 'validation failed'}

      expect(Errors.for(:validation_failed)).to eq(err)
    end
  end

  context 'validation errors' do
    it 'includes model errors' do
      test_class = Class.new
      test_class.include(ActiveModel::Validations)
      test_class.extend(ActiveModel::Naming)
      instance = test_class.new
      expect(Errors.for(:validation_failed, model: instance)).to have_key(:errors)
    end
  end
end
