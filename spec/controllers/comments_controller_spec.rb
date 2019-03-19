require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

 	describe 'POST #create' do

 		context 'invalid params (content < 10)' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {event_id: FactoryBot.create( :event ).id, content: "spec"}
 			end

 			it 'return comment not save' do 				
 				expect(response).to have_http_status(422)
 			end
 		end

 		context 'invalid params (content > 200)' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {event_id: FactoryBot.create( :event ).id, content: ("spec"*100)}
 			end

 			it 'return comment not save' do 				
 				expect(response).to have_http_status(422)
 			end
 		end

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :create, params: {event_id: FactoryBot.create( :event ).id, content: "spec content valid"}
 			end

 			it 'return comment save' do 				
 				expect(response).to have_http_status(302)
 			end

 			it 'comment is persisted' do
 				expect(Comment.count).to eq(1)
 			end
 		end
 	end

 	describe 'DELETE #destroy' do

 		context 'valid params' do

 			before(:each) do
 				login_with FactoryBot.create( :user )
 				request.env['HTTP_REFERER'] = '/'
 				post :destroy, params: {event_id: FactoryBot.create( :event ).id, id: FactoryBot.create( :comment ).id}
 			end

 			it 'should return comment destroy' do 				
 				expect(response).to have_http_status(1)
 			end
 		end
 	end
 end