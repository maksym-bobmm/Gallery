# frozen_string_literal: true

require 'rails_helper'
require 'support/shared/controller_helpers'

RSpec.describe LikesController, type: :controller do
  describe 'old' do
    subject { create(:like) }
    let(:user) { subject.user }
    let(:image) { subject.image }
    context 'test not signed in user' do
      it 'redirects on likes#create' do
        post :create,  params: { img_id: image.id }
        assert_redirect_and_redirected_to_sign_in
      end
      it 'redirects to sign_in on likes#destroy' do
        delete :destroy, params: { id: subject.id, img_id: image.id }
        assert_redirect_and_redirected_to_sign_in
      end
    end
    context 'test signed in user' do
      before(:each) { sign_in user }
      it 'redirects to image on likes#create' do
        subject.destroy
        post :create, params: { img_id: image.id }
        assert_redirect_and_redirected_to image_path(image)
      end
      it 'redirects on likes#destroy' do
        delete :destroy, params: { id: subject.id, img_id: image.id }
        assert_redirect_and_redirected_to image_path(image)
      end
      it 'does not add new like record if an exist one' do
        expect do
          post :create, params: { img_id: image.id }
        end.to_not change(Like, :count)
      end
    end
  end
  describe  do
    context 'routes' do
      it { is_expected.to route(:post, '/likes').to(action: :create) }
      it { is_expected.to route(:delete, '/likes/1').to(action: :destroy, id: 1) }
      it { is_expected.to_not route(:get, '/likes').to(action: :index) }
      it { is_expected.to_not route(:get, '/likes/1').to(action: :show, id: 1) }
      it { is_expected.to_not route(:get, 'likes/1/edit').to(action: :edit, id: 1)}
      it { is_expected.to_not route(:patch, '/likes/1').to(action: :update, id: 1) }
      it { is_expected.to_not route(:put, '/likes/1').to(action: :update, id: 1) }
      it { is_expected.to_not route(:get, '/likes/new').to(action: :new) }
    end
    context 'callbacks' do
      %i[authenticate_user! find_image].each do |method|
        it { is_expected.to use_before_action(method) }
      end
      it { is_expected.to use_after_action(:logging) }
    end
  end
end
