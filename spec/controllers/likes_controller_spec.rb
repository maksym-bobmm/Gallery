require 'rails_helper'

RSpec.describe LikesController, type: :controller do
    subject { create(:like) }
    let(:user) { subject.user }
    let(:image) { subject.image }
    context 'test not signed in user' do

      it 'is get redirect on likes#create' do
        post :create,  params: { img_id: image.id }
        assert_response :redirect
        assert_redirected_to new_user_session_path(locale: nil)
      end
      it 'is get redirect on likes#destroy' do
        delete :destroy, params: { id: subject.id, img_id: image.id }
        assert_response :redirect
        assert_redirected_to new_user_session_path(locale: nil)
      end
    end
    context 'test signed in user' do
      before(:each) { sign_in user }
      it 'is get redirect on likes#create' do
        post :create, params: { img_id: image.id }
        assert_response :redirect
        assert_redirected_to image_path(image)
      end
      it 'is get redirect on likes#destroy' do
        delete :destroy, params: { id: subject.id, img_id: image.id }
        assert_response :redirect
        assert_redirected_to image_path(image)
      end
    end
end
