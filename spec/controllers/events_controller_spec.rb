require 'rails_helper'

RSpec.describe EventsController, type: :controller do

 	describe 'post #create' do

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {title: "blablabla", description: "vive les specs controller", start_date: "2019-05-01", hour_start: "15:00", duration: 60, sport_id: FactoryBot.create( :sport ), city_id: FactoryBot.create( :city ), owner_id: FactoryBot.create( :user )}
 			end

 			it 'return event save' do
 				expect(response).to have_http_status(302)
 			end

 			it 'event is persisted' do
 				expect(Event.count).to eq(1)
 			end
 		end

 		context 'invalid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {title: "", description: "", start_date: "2019-05-01", hour_start: "15:00", duration: 60, sport_id: FactoryBot.create( :sport ), city_id: FactoryBot.create( :city ), owner_id: FactoryBot.create( :user )}
 			end

 			it 'return event not save' do
 				expect(response).to have_http_status(422)
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
 				get :index, params: { start_date: "", city: "Ville", sport: "Sport" }
 			end

 			it "returns success" do
        		expect(response).to be_successful
      		end

 			it 'should return 200' do 				
 				expect(response).to have_http_status(200)
 			end
 		end
 	end

 	describe 'patch #update' do

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				patch :update, params: { event: { title: "spec de spec de spec de sport de event de user de...", sport_id: FactoryBot.create( :sport ), city_id: FactoryBot.create( :city ), latitude: "", longitude: "", duration: 60, start_date: "2019-04-21", description: "les specs de controller spec spec spec!!"}, hour_start: "15;30", id: FactoryBot.create( :event ) }
 			end

 			it 'return event update' do 				
 				expect(response).to have_http_status(302)
 			end

 			it 'event is persisted' do
 				expect(Event.count).to eq(1)
 			end
 		end

 		context 'invalid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				patch :update, params: { event: { title: "", sport_id: FactoryBot.create( :sport ), city_id: FactoryBot.create( :city ), latitude: "", longitude: "", duration: 60, start_date: "2019-04-21", description: "les specs de controller spec spec spec!!"}, hour_start: "15;30", id: FactoryBot.create( :event ) }
 			end

 			it 'return event not update' do 				
 				expect(response).to have_http_status(422)
 			end

 			it 'event is persisted' do
 				expect(Event.count).to eq(1)
 			end
 		end
 	end
end