require 'rails_helper'

RSpec.describe OpinionsController, type: :controller do

 	describe 'POST #create' do

 		context 'valid params' do

 			before(:each) do

 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {user_id: FactoryBot.create( :user ), recipient_id: FactoryBot.create( :user ).id, content: "balbalbalbalbalblablabla"}

 			end

 			it 'should return an error' do 				
 				expect(response).to have_http_status(302)
 			end

 		end

 	end

 	describe 'POST #destroy' do

 		context 'valid params' do

 			before(:each) do

 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :destroy, params: {user_id: FactoryBot.create( :user ), id: FactoryBot.create( :opinion ).id}

 			end

 			it 'should return an error' do 				
 				expect(response).to have_http_status(302)
 			end

 		end

 	end

end