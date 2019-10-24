# frozen_string_literal: true

require 'rails_helper'
require 'support/shared/controller_helpers'

RSpec.describe CategoriesController, type: :controller do
  describe 'old' do
    subject { create(:category) }
    context 'test checks that unsigned in user' do
      it 'gets success on category#index page' do
        get :index
        assert_response :success
      end
      it 'gets success on category#show page' do
        get :show, params: { id: subject.id }
        assert_response :success
      end
      # it 'is_expected.to redirect to sign in on category#new' do
      #   get :new
      #   assert_redirect_and_redirected_to_sign_in
      # end
      it 'redirects to sign in on category#create' do
        post :create
        assert_redirect_and_redirected_to_sign_in
      end
      it 'redirects to sign in on category#destroy' do
        delete :destroy, params: { id: subject.id }
        assert_redirect_and_redirected_to_sign_in
      end
      it 'redirects to sign in on category#edit' do
        get :edit, params: { id: subject.id }
        assert_redirect_and_redirected_to_sign_in
      end
      it 'redirects to sign in on category#update with PATCH method' do
        patch :update, params: { id: subject.id }
        assert_redirect_and_redirected_to_sign_in
      end
      it 'redirects to sign in on category#update with PUT method' do
        put :update, params: { id: subject.id }
        assert_redirect_and_redirected_to_sign_in
      end
    end
    context 'test checks that signed in user' do
      let(:user) { subject.user }
      before(:each) { sign_in user }
      after(:each) { sign_out user }
      it 'gets success on category#index page' do
        get :index
        assert_response :success
      end
      it 'gets success on category#show page' do
        get :show, params: { id: subject.id }
        assert_response :success
      end
      # it 'is_expected.to get success on category#new' do
      #   get :new
      #   assert_response :success
      # end
      it 'gets success on category#create' do
        post :create, params: { name: Faker::Lorem.word, fake: 123 }
        assert_redirect_and_redirected_to categories_path
      end
      it 'gets success on category#destroy' do
        delete :destroy, params: { id: subject.id }
        assert_redirect_and_redirected_to categories_path
      end
      it 'gets success on category#edit' do
        get :edit, params: { id: subject.id }
        assert_response :success
      end
      it 'gets success on category#update with PATCH method' do
        patch :update, params: { id: subject.id, name: Faker::Lorem.word }
        assert_redirect_and_redirected_to categories_path
      end
      it 'gets success on category#update with PUT method' do
        put :update, params: { id: subject.id, name: Faker::Lorem.word }
        assert_redirect_and_redirected_to categories_path
      end
    end
    context 'test checks that instance variable' do
      it '@category isn`t nil on category#show' do
        get :show, params: { id: subject.id }
        expect(@controller.instance_variable_get(:@category)).not_to be_nil
        # expect(@controller.instance_variable_get(:@subscription_exist)).to wont_be_nil
      end
      it '@subscription_exist is true if subscription exist' do
        sign_in subject.user
        create(:subscription, category_id: subject.id, user_id: subject.user.id)
        get :show, params: { id: subject.id }
        expect(@controller.instance_variable_get(:@subscription_exist)).to be true
      end
      it '@subscription_exist is false if subscription does not exist' do
        sign_in subject.user
        get :show, params: { id: subject.id }
        expect(@controller.instance_variable_get(:@subscription_exist)).to be false
      end
      it '@subscription_exist is false if user not signed in' do
        get :show, params: { id: subject.id }
        expect(@controller.instance_variable_get(:@subscription_exist)).to be false
      end
    end
  end
  describe  do
    context 'routes' do
      it { is_expected.to route(:get, '/categories').to(action: :index) }
      it { is_expected.to route(:get, '/categories/1').to(action: :show, id: 1) }
      it { is_expected.to route(:get, 'categories/1/edit').to(action: :edit, id: 1)}
      it { is_expected.to route(:post, '/categories').to(action: :create) }
      it { is_expected.to route(:patch, '/categories/1').to(action: :update, id: 1) }
      it { is_expected.to route(:put, '/categories/1').to(action: :update, id: 1) }
      it { is_expected.to route(:delete, '/categories/1').to(action: :destroy, id: 1) }
      it { is_expected.to_not route(:get, '/categories/new').to(action: :new) }
    end
  end
end
