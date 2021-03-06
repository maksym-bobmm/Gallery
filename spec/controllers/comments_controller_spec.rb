# frozen_string_literal: true

require 'rails_helper'
require 'support/shared/controller_helpers'

RSpec.describe CommentsController, type: :controller do
  let(:image) { create(:image) }
  context 'test unsigned in user' do
    it 'redirects to sign_in page on comments#create' do
      post :create, params: { body: Faker::Lorem.word }
      assert_redirect_and_redirected_to_sign_in
    end
  end
  context 'test signed in user' do
    let(:user) { create(:user) }
    before(:each) { sign_in user }
    it 'redirects to sign_in page on comments#create' do
      post :create, params: { body: Faker::Lorem.sentence, image_id: image.id }
      assert_redirect_and_redirected_to image_path(@controller.instance_variable_get(:@image))
    end
  end
  describe  do
    context 'routes' do
      it { is_expected.to route(:post, '/comments').to(action: :create) }
      it { is_expected.to_not route(:get, '/comments').to(action: :index) }
      it { is_expected.to_not route(:get, '/comments/1').to(action: :show, id: 1) }
      it { is_expected.to_not route(:get, 'comments/1/edit').to(action: :edit, id: 1)}
      it { is_expected.to_not route(:patch, '/comments/1').to(action: :update, id: 1) }
      it { is_expected.to_not route(:put, '/comments/1').to(action: :update, id: 1) }
      it { is_expected.to_not route(:delete, '/comments/1').to(action: :destroy, id: 1) }
      it { is_expected.to_not route(:get, '/comments/new').to(action: :new) }
    end
    context 'callbacks' do
      %i[authenticate_user! find_image].each do |method|
        it { is_expected.to use_before_action(method) }
      end
      it { is_expected.to use_after_action(:logging) }
    end
    context 'strong params' do
      let(:image) { create(:image) }
      before(:each) { sign_in image.category.user }
      it do
        params = { body: Faker::Lorem.sentence, image_id: image.id }
        is_expected.to permit(:body, :image_id).for(:create, params: params)
      end
    end
  end
end
