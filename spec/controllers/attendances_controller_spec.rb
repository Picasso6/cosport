require 'rails_helper'

RSpec.describe AttendancesController, type: :controller do

 	describe 'POST #create' do

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {event_id: FactoryBot.create( :event )}
 			end

 			it 'should return an error' do 				
 				expect(response).to have_http_status(302)
 			end
 		end
 	end

 	describe 'GET #edit' do

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				get :edit, params: {id: FactoryBot.create( :attendance ), event_id: FactoryBot.create( :event )}
 			end

 			it 'should return an error' do 				
 				expect(response).to have_http_status(200)
 			end
 		end
 	end

 	describe 'patch #update' do

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				patch :update, params: {id: FactoryBot.create( :attendance ), event_id: FactoryBot.create( :event )}
 			end

 			it 'should return an error' do 				
 				expect(response).to have_http_status(302)
 			end
 		end
 	end

 	describe 'DELETE #destroy' do

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				delete :update, params: {id: FactoryBot.create( :attendance ), event_id: FactoryBot.create( :event )}
 			end

 			it 'should return an error' do 				
 				expect(response).to have_http_status(302)
 			end
 		end
 	end
end