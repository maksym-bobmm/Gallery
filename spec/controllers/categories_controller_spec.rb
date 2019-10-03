require 'rails_helper'
require 'support/shared/controller_helpers'

RSpec.describe CategoriesController, type: :controller do
  subject { create(:category) }
  context 'test that unsigned in user' do
    it 'gets success on category#index page' do
      get :index
      assert_response :success
    end
    it 'gets success on category#show page' do
      get :show, params: { id: subject.id }
      assert_response :success
    end
    # it 'should redirect to sign in on category#new' do
    #   get :new
    #   assert_redirect_and_redirected_to_sign_in
    # end
    it 'redirects to sign in on category#create' do
      post :create
      assert_redirect_and_redirected_to_sign_in
    end
    it 'redirects to sign in on category#destroy' do
      delete :destroy, params: { id: subject.id}
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
  context 'test that signed in user' do
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
    # it 'should get success on category#new' do
    #   get :new
    #   assert_response :success
    # end
    it 'gets success on category#create' do
      post :create, params: { name: Faker::Lorem.word, fake: 123 }
      assert_response :redirect
      assert_redirected_to categories_path
    end
    it 'gets success on category#destroy' do
      delete :destroy, params: { id: subject.id }
      assert_response :redirect
      assert_redirected_to categories_path
    end
    it 'gets success on category#edit' do
      get :edit, params: { id: subject.id }
      assert_response :success
    end
    it 'gets success on category#update with PATCH method' do
      patch :update, params: { id: subject.id, name: Faker::Lorem.word }
      assert_response :redirect
      assert_redirected_to categories_path
    end
    it 'gets success on category#update with PUT method' do
      put :update, params: { id: subject.id, name: Faker::Lorem.word }
      assert_response :redirect
      assert_redirected_to categories_path
    end
  end
  # context 'has not null instance variable' do
  #   it '@category on category#show' do
  #     expect(@controller.instance_variable_get(:@category)).to wont_be_nil
  #     expect(@controller.instance_variable_get(:@subscription_exist)).to wont_be_nil
  #   end
  # end
end
