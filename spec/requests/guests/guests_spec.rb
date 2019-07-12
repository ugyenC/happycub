# require 'rails_helper'
# RSpec.describe BookingsController, type: :controller do
#   describe 'Booking controller request specs' do
#     login_user
#     let!(:guest){create :guest}
#
#     it 'should success and render to index page' do
#       get :index
#       expect(response).to have_http_status(200)
#       expect(response).to render_template :index
#     end
#
#     it 'should create an event and generate a notice.' do
#       params = {
#         title: 'Test',
#         capacity: 12,
#         description: 'This is test',
#         start_date: Date.today,
#         end_date: Date.today,
#         location:'Thimphu'
#       }
#       post(:create, params: {event: params})
#       expect(flash[:notice]).to eq "Event was successfully created."
#     end
#
#     it 'should display the details of event.' do
#       get :show, params: {id: event.id}
#       expect(response).to have_http_status(200)
#       expect(response).to render_template :show
#     end
#
#     it 'should update an existing event and display a success notice' do
#       params = {
#         title: 'Event Updated',
#         capacity: 20
#       }
#       put(:update, params: { id: event.id, event: params })
#       event.reload
#       params.keys.each do |key|
#         expect(event.attributes[key.to_s]).to eq params[key]
#       end
#       expect(flash[:notice]).to eq 'Event was successfully updated.'
#     end
#
#     it 'should delete an event and display a success notice' do
#       expect { delete :destroy, params: { id: event.id } }
#       #binding.pry
#       #expect(flash[:notice]).to eq "Event was successfully destroyed."
#     end
#
#
#
#
#
#
#     #  context 'GET #show' do
#     #   let!(:product) { create :product }
#
#     #  it 'should success and render to edit page' do
#     #     get :show, params: { id: product.id }
#     #     expect(response).to have_http_status(200)
#     #     expect(response).to render_template :edit
#     #    end
#     #   end
#   end
# end