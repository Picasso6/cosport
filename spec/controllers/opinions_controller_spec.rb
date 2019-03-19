require 'rails_helper'

RSpec.describe OpinionsController, type: :controller do

 	describe 'POST #create' do

 		context 'invalid params (content < 10)' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {user_id: FactoryBot.create( :user ), recipient_id: FactoryBot.create( :user ).id, content: "spec"}
 			end

 			it 'return opinion not save' do 				
 				expect(response).to have_http_status(422)
 			end
 		end

 		context 'invalid params (content > 200)' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {user_id: FactoryBot.create( :user ), recipient_id: FactoryBot.create( :user ).id, content: ("spec"*100)}
 			end

 			it 'return opinion not save' do 				
 				expect(response).to have_http_status(422)
 			end
 		end

 		context 'invalid params (content > 200)' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {user_id: FactoryBot.create( :user ), recipient_id: FactoryBot.create( :user ).id, content: "spec content valid"}
 			end

 			it 'return opinion save' do 				
 				expect(response).to have_http_status(302)
 			end

 			it 'opinion is persisted' do
 				expect(Opinion.count).to eq(1)
 			end
 		end
 	end

 	describe 'DELETE #destroy' do

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				delete :destroy, params: {user_id: FactoryBot.create( :user ), id: FactoryBot.create( :opinion ).id}
 			end

 			it 'should return 302' do 				
 				expect(response).to have_http_status(302)
 			end
 		end
 	end
end