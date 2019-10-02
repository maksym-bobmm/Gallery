require 'rails_helper'
require 'support/shared/controller_helpers'

RSpec.describe CommentsController, type: :controller do
  let(:image) { create(:image) }
  context 'test unsigned in user' do
    it 'redirects to sign_in page on comments#new' do
      get :new
      assert_redirect_and_redirected_to_sign_in
    end
    it 'redirects to sign_in page on comments#create' do
      post :create, params: { body: Faker::Lorem.word }
      assert_redirect_and_redirected_to_sign_in
    end
  end
  context 'test signed in user' do
    let(:user) { create(:user) }
    before(:each) { sign_in user }
    it 'redirects to sign_in page on comments#new' do
      get :new
      assert_response :success
    end
    it 'redirects to sign_in page on comments#create' do
      post :create, params: { body: Faker::Lorem.sentence, image_id: image.id }
      assert_response :redirect
      assert_redirected_to image_path(@controller.instance_variable_get(:@image))
    end
  end
end
