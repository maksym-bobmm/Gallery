require 'rails_helper'

RSpec.describe LocalesController, type: :controller do
  let(:test_url) { 'http://test.com/categories' }
  before(:each) { @request.env['HTTP_REFERER'] = test_url }
  context 'test that unsigned user' do
    it 'after change language redirects to same page' do
      assert_redirected_to test_url
    end
  end
  context 'test that signed in user' do
    let(:user) { create(:user) }
    before(:each) { sign_in user }
    it 'has change locale parameter' do
      expect { put :update, params: { locale: 'en' } }.to change { User.find(user.id).locale }
      # expect(user.locale).to be change(user.locale, 'en')
      assert_redirected_to test_url
    end
    it 'after change language redirects to same page' do
      assert_redirected_to test_url
    end
  end
end
