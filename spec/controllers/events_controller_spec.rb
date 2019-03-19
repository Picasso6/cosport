require 'rails_helper'

RSpec.describe EventsController, type: :controller do

 	describe 'post #create' do

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {title: "blablabla", description: "vive les specs controller", start_date: "2019-05-01", hour_start: "15:00", duration: 60, sport_id: FactoryBot.create( :sport ), city_id: FactoryBot.create( :city ), owner_id: FactoryBot.create( :user )}
 			end

 			it 'should return 302' do
 				expect(response).to have_http_status(302)
 			end
 		end
 	end

 	#bug ===============>
 	describe 'get #show' do

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				get :show, params: {id: FactoryBot.create( :event )}
 			end

 			it 'should return 302' do 				
 				expect(response).to have_http_status(302)
 			end
 		end
 	end

 	describe 'get #index' do

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
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