require 'rails_helper'

RSpec.describe "vehicle_config_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/vehicle_config_types",
      params: params
  end

  describe 'basic fetch' do
    let!(:vehicle_config_type1) { create(:vehicle_config_type) }
    let!(:vehicle_config_type2) { create(:vehicle_config_type) }

    it 'serializes the list correctly' do
      make_request
      expect(json_ids(true)).to match_array([vehicle_config_type1.id, vehicle_config_type2.id])
      assert_payload(:vehicle_config_type, vehicle_config_type1, json_items[0])
      assert_payload(:vehicle_config_type, vehicle_config_type2, json_items[1])
    end
  end
end