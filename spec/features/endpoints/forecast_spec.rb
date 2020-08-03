require 'rails_helper'

RSpec.describe 'forecast endpoint' do
  xit 'returns forecast info for a location' do
    visit '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end
