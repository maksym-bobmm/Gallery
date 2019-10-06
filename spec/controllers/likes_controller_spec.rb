require 'rails_helper'
require 'support/shared/controller_helpers'

RSpec.describe LikesController, type: :controller do
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
        post :create, params: { img_id: image.id }
        assert_redirect_and_redirected_to image_path(image)
      end
      it 'redirects on likes#destroy' do
        delete :destroy, params: { id: subject.id, img_id: image.id }
        assert_redirect_and_redirected_to image_path(image)
      end
    end
end
