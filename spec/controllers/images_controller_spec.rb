require 'rails_helper'
require 'support/shared/controller_helpers'

RSpec.describe ImagesController, type: :controller do
  subject { create(:image) }
  let(:image) { create(:image) }
  context 'test that not signed in user' do
    it 'gets success on image#index' do
      get :index
      assert_response :success
    end
    # it 'get redirect to sign_in page on image#new' do
    #   get :new
    #   assert_redirect_and_redirected_to_sign_in
    # end
    it 'redirects to sign_in page on image#create' do
      post :create
      assert_redirect_and_redirected_to_sign_in
    end
    it 'gets success on image#show' do
      get :show, params: { id: subject.id }
      assert_response :success
    end
  end
  context 'test signed in user' do
    let(:user) { create(:user) }
    before(:each) { sign_in user }
    it 'gets success on image#index' do
      get :index
      assert_response :success
    end
    # it 'get success on image#new' do
    #   get :new
    #   assert_response :success
    # end
    it 'redirects on image#create' do
      post :create, params: { cat_id: image.category }
      assert_redirect_and_redirected_to @controller.instance_variable_get(:@category)
    end
    it 'gets success on image#show' do
      get :show, params: { id: subject.id }
      assert_response :success
    end
  end
  context 'method' do
    it 'to_s returns a string' do
      expect(image.to_s.class).to be String
    end
  end
end
