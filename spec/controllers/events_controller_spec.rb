require 'rails_helper'

RSpec.describe EventsController, type: :controller do

 	describe 'post #create' do

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {title: "blablabla", description: "vive les specs controller", start_date: , duration: 60, sport_id: FactoryBot.create( :sport ), city_id: FactoryBot.create( :city ), owner_id: FactoryBot.create( :user )}
 			end

 			it 'should return an error' do 				
 				expect(response).to have_http_status(302)
 			end

 		end

 	end

end