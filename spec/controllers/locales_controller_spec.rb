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
end
