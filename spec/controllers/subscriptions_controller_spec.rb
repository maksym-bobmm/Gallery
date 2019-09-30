require 'rails_helper'
require 'support/shared/controller_helpers'

RSpec.describe SubscriptionsController, type: :controller do
  subject { create(:subscription) }
  context 'test unsigned user' do
    it 'gets redirect to sign_in on subscriptions#create' do
      post :create, params: { user_id: subject.user.id, id: subject.category.id }
      assert_redirect_and_redirected_to_sign_in
    end
    it 'gets redirect to sign_in on subscriptions#create' do
      delete :destroy, params: { user_id: subject.user.id, id: subject.category.id }
      assert_redirect_and_redirected_to_sign_in
    end
  end
  context 'test signed in user' do
    before(:each) { sign_in subject.user }
    it 'gets redirect  on subscriptions#create' do
      post :create, params: { user_id: subject.user.id, id: subject.category.id }
      assert_redirected_to category_path(@controller.instance_variable_get(:@category))
    end
    it 'gets redirect to sign_in on subscriptions#create' do
      delete :destroy, params: { user_id: subject.user.id, id: subject.category.id }
      assert_redirected_to category_path(@controller.instance_variable_get(:@category))
    end
  end
end
