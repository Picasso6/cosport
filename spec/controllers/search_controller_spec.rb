require 'rails_helper'

RSpec.describe SearchController, type: :controller do

 	describe 'get #index' do

 		context 'valid params' do

 			before(:each) do
 				get :index
 			end

 			it "returns success" do
        		expect(response).to be_successful
      		end

 			it 'should return 200' do 				
 				expect(response).to have_http_status(200)
 			end
 		end
 	end
end