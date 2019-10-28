# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocalesController, type: :controller do
  let(:test_url) { 'http://test.com/categories' }
  let(:locale) { 'en' }
  let(:test_url_expected) { "#{test_url}?locale=#{locale}" }

  before(:each) { @request.env['HTTP_REFERER'] = test_url }
  context 'test that unsigned user' do
    it 'redirects to same page with new locale param after change language with PUT method (locales#update)' do
      put :update, params: { locale: locale }
      assert_redirected_to test_url_expected
    end
    it 'redirects to same page with new locale param after change language with PATCH method (locales#update)' do
      patch :update, params: { locale: locale }
      assert_redirected_to test_url_expected
    end
  end
  context 'test that signed in user' do
    let(:user) { create(:user) }
    before(:each) { sign_in user }
    it 'must have changed DB record "locale" after change language with PUT method (locales#update)' do
      expect { put :update, params: { locale: locale } }.to change { User.find(user.id).locale }
    end
    it 'redirects to same page with new locale param after change language with PUT method (locales#update)' do
      put :update, params: { locale: locale }
      assert_redirected_to test_url_expected
    end
    it 'must have changed DB record "locale" after change language with PATCH method (locales#update)' do
      expect { patch :update, params: { locale: locale } }.to change { User.find(user.id).locale }
    end
    it 'redirects to same page with new locale param after change language with PATCH method (locales#update)' do
      patch :update, params: { locale: locale }
      assert_redirected_to test_url_expected
    end
  end

  describe  do
    context 'routes' do
      it { is_expected.to route(:patch, '/locales').to(action: :update) }
      it { is_expected.to route(:put, '/locales').to(action: :update) }
      it { is_expected.to_not route(:get, '/locales').to(action: :index) }
      it { is_expected.to_not route(:get, '/locales/1').to(action: :show, id: 1) }
      it { is_expected.to_not route(:get, 'locales/1/edit').to(action: :edit, id: 1)}
      it { is_expected.to_not route(:post, '/locales').to(action: :create) }
      it { is_expected.to_not route(:delete, '/locales/1').to(action: :destroy, id: 1) }
      it { is_expected.to_not route(:get, '/locales/new').to(action: :new) }
    end
  end
end
