# frozen_string_literal: true

require 'rails_helper'
require 'support/shared/controller_helpers'

RSpec.describe SubscriptionsController, type: :controller do
  describe 'old' do
    subject { create(:subscription) }
    context 'test unsigned user' do
      it 'redirects to sign_in on subscriptions#create' do
        post :create, params: { user_id: subject.user.id, id: subject.category.id }
        assert_redirect_and_redirected_to_sign_in
      end
      it 'redirects to sign_in on subscriptions#create' do
        delete :destroy, params: { user_id: subject.user.id, id: subject.category.id }
        assert_redirect_and_redirected_to_sign_in
      end
    end
    context 'test signed in user' do
      before(:each) { sign_in subject.user }
      it 'redirects  on subscriptions#create' do
        subject.destroy
        post :create, params: { user_id: subject.user.id, id: subject.category.id }
        assert_redirect_and_redirected_to category_path(@controller.instance_variable_get(:@category))
      end
      it 'redirects to sign_in on subscriptions#create' do
        delete :destroy, params: { user_id: subject.user.id, id: subject.category.id }
        assert_redirect_and_redirected_to category_path(@controller.instance_variable_get(:@category))
      end
      it 'does not add new subscription record if exist one' do
        # second_subscription = build(:subscription, user_id: subject.user.id, category_id: subject.category.id)
        expect do
          post :create, params: { user_id: subject.user.id, id: subject.category.id }
        end.to_not change(Subscription, :count)
      end
    end
  end
  describe  do
    context 'routes' do
      it { is_expected.to route(:post, '/subscriptions').to(action: :create) }
      it { is_expected.to route(:delete, '/subscriptions/1').to(action: :destroy, id: 1) }
      it { is_expected.to_not route(:get, '/subscriptions').to(action: :index) }
      it { is_expected.to_not route(:get, '/subscriptions/1').to(action: :show, id: 1) }
      it { is_expected.to_not route(:get, 'subscriptions/1/edit').to(action: :edit, id: 1)}
      it { is_expected.to_not route(:patch, '/subscriptions/1').to(action: :update, id: 1) }
      it { is_expected.to_not route(:put, '/subscriptions/1').to(action: :update, id: 1) }
      it { is_expected.to_not route(:get, '/subscriptions/new').to(action: :new) }
    end
  end
end
