require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

 	describe 'POST #create' do

 		context 'invalid params' do

 			before(:each) do

 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {event_id: FactoryBot.create( :event ).id, content: ""}

 			end

 			it 'should return an error' do 				
 				expect(response).to have_http_status(302)
 			end

 		end

 	end
 	
 end