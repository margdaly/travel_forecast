require 'rails_helper'

describe ForecastFacade do
  describe '#initialize' do
    it 'exists' do
      facade = ForecastFacade.new('denver,co')

      expect(facade).to be_a(ForecastFacade)
    end
  end
end
