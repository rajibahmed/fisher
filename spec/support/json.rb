module JsonHelper
  def response_json
    JSON.parse(response.body, symbolize_names: true)
  end
end

RSpec.configure do |config|
  config.include JsonHelper
end
