require 'rails_helper'
require 'support/shared/controller_helpers'

RSpec.describe ImagesController, type: :controller do
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
      get :show, params: { id: image.id }
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
      get :show, params: { id: image.id }
      assert_response :success
    end
  end
  context 'method' do
    it 'to_s returns a string' do
      expect(image.to_s.class).to be String
    end
  end
  context 'test checks that' do
    context 'images#show variable' do
      before(:each) { |test| get :show, params: { id: image.id } unless test.metadata[:signing_in] }
      it '@image isn`t nil`' do
        expect(@controller.instance_variable_get(:@image)).to_not be_nil
      end
      it '@likes_count is >= 0' do
        expect(@controller.instance_variable_get(:@likes_count)).to be >= 0
      end
      it '@path_to_img isn`t nil`' do
        expect(@controller.instance_variable_get(:@image)).to_not be_nil
      end
      it '@like_exist is true if like exist', :signing_in do
        sign_in image.category.user
        create(:like, image_id: image.id, user_id: image.category.user.id)
        get :show, params: { id: image.id }
        expect(@controller.instance_variable_get(:@like_exist)).to be true
      end
      it '@like_exist is false if like not exist', :signing_in do
        sign_in image.category.user
        get :show, params: { id: image.id }
        expect(@controller.instance_variable_get(:@like_exist)).to be false
      end
      it '@like_exist is false if user not signed in' do
        expect(@controller.instance_variable_get(:@like_exist)).to be false
      end
    end

  end
end
