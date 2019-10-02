require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  context 'test that not signed in user' do
    it 'gets success on welcome#index' do
      get :index
      assert_response :success
    end
  end
  context 'test that signed in user' do
    it 'gets success on welcome#index' do
      get :index
      assert_response :success
    end
  end
end
