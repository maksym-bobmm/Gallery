# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'tests check that' do
    context 'not signed in user' do
      it 'gets success on welcome#index' do
        get :index
        assert_response :success
      end
    end
    context 'signed in user' do
      it 'gets success on welcome#index' do
        get :index
        assert_response :success
      end
    end
    context 'test that welcome#index variable' do
      before(:each) { |test| get :index unless test.metadata[:no_get_index] }
      it '@categories_count has value >= 0' do
        expect(@controller.instance_variable_get(:@categories_count)).to be >= 0
      end
      it '@images_count has value >= 0' do
        expect(@controller.instance_variable_get(:@images_count)).to be >= 0
      end
      it '@likes_count has value >= 0' do
        expect(@controller.instance_variable_get(:@likes_count)).to be >= 0
      end
      it '@comments_count has  >= 0' do
        expect(@controller.instance_variable_get(:@comments_count)).to be >= 0
      end
      it '@top_popular_images count is 5', :no_get_index do
        Image.destroy_all
        5.times { create(:image) }
        get :index
        expect(@controller.instance_variable_get(:@top_popular_images).count).to eq(5)
      end
    end
  end
  describe  do
    context 'routes' do
      it { should route(:get, '/').to(action: :index) }
    end
  end
end
