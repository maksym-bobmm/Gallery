# frozen_string_literal: true

require 'rails_helper'
require 'support/shared/controller_helpers'

RSpec.describe ImagesController, type: :controller do
  let(:image) { create(:image) }
  context 'test that not signed in user' do
    it 'gets success on image#index' do
      get :index
      assert_response :success
    end
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
  describe  do
    context 'routes' do
      it { is_expected.to route(:get, '/images').to(action: :index) }
      it { is_expected.to route(:get, '/images/1').to(action: :show, id: 1) }
      it { is_expected.to route(:post, '/images').to(action: :create) }
      it { is_expected.to_not route(:get, 'images/1/edit').to(action: :edit, id: 1)}
      it { is_expected.to_not route(:patch, '/images/1').to(action: :update, id: 1) }
      it { is_expected.to_not route(:put, '/images/1').to(action: :update, id: 1) }
      it { is_expected.to_not route(:delete, '/images/1').to(action: :destroy, id: 1) }
      it { is_expected.to_not route(:get, '/images/new').to(action: :new) }
    end
    context 'params' do
      let(:category) { create(:category) }
      before(:each) { sign_in category.user }
      it do
        params =  { path:  Rails.root.join('app', 'assets', 'images', 'categories', 'cars', '239145_main.jpg').open,
                    cat_id: category.id }
        should permit(:path).for(:create, params: params)
      end
    end
  end
end
