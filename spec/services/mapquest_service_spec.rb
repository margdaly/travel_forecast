require 'rails_helper'

describe MapquestService do
  describe '#geocode_address' do
    it 'returns coordinates for a city' do
      location = 'denver,co'

      stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?location=#{location}") \
        .to_return(status: 200, body: File.read('spec/fixtures/mapquest/geocode_city.json'))

      response = MapquestService.new.geocode_address(location)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:results)
      expect(response[:results]).to be_a(Array)

      results = response[:results].first

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
      # response[:results][0][:locations][0][:latLng][:lat]
      expect(locations[:latLng]).to have_key(:lng)
      expect(locations[:latLng][:lng]).to be_a(Float)
      # response[:results][0][:locations][0][:latLng][:lng]
    end

    it 'returns coordinates for a place' do
      location = 'fenway park, ma'

      stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?location=#{location}") \
        .to_return(status: 200, body: File.read('spec/fixtures/mapquest/geocode_place.json'))

      response = MapquestService.new.geocode_address(location)

        expect(response).to be_a(Hash)
        expect(response).to have_key(:results)
        expect(response[:results]).to be_a(Array)

        results = response[:results].first

        expect(results).to have_key(:providedLocation)
        expect(results[:providedLocation]).to be_a(Hash)
        expect(results[:providedLocation]).to have_key(:location)
        expect(results[:providedLocation][:location]).to eq(location) # 'fenway park, ma'
        expect(results).to have_key(:locations)
        expect(results[:locations]).to be_a(Array)

        locations = results[:locations].first

        expect(locations).to have_key(:latLng)
        expect(locations[:latLng]).to be_a(Hash)
        expect(locations[:latLng]).to have_key(:lat)
        expect(locations[:latLng][:lat]).to be_a(Float)
        # response[:results][0][:locations][0][:latLng][:lat]
        expect(locations[:latLng]).to have_key(:lng)
        expect(locations[:latLng][:lng]).to be_a(Float)
        # response[:results][0][:locations][0][:latLng][:lng]
    end
  end
end
