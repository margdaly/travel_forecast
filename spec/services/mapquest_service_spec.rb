require 'rails_helper'

describe MapquestService do
  let (:service) { MapquestService.new }

  describe '#geocode_address' do
    it 'returns coordinates for a city' do
      location = 'denver,co'
      data = service.geocode_address(location)

      expect(data).to be_a(Hash)
      expect(data).to have_key(:results)
      expect(data[:results]).to be_a(Array)

      results = data[:results].first

      expect(results).to have_key(:providedLocation)
      expect(results[:providedLocation]).to be_a(Hash)
      expect(results[:providedLocation]).to have_key(:location)
      expect(results[:providedLocation][:location]).to eq(location) # 'denver,co'
      expect(results).to have_key(:locations)
      expect(results[:locations]).to be_a(Array)

      locations = results[:locations].first

      expect(locations).to have_key(:latLng)
      expect(locations[:latLng]).to be_a(Hash)
      expect(locations[:latLng]).to have_key(:lat)
      expect(locations[:latLng][:lat]).to be_a(Float)
      # data[:results][0][:locations][0][:latLng][:lat]
      expect(locations[:latLng]).to have_key(:lng)
      expect(locations[:latLng][:lng]).to be_a(Float)
      # data[:results][0][:locations][0][:latLng][:lng]
    end
  end
end
