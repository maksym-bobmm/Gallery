require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  context 'callbacks' do
    %i[sort_category configure_permitted_parameters].each do |method|
      it { is_expected.to use_before_action(method) }
    end
    it { is_expected.to use_after_action(:navigation) }
    it { is_expected.to use_around_action(:switch_locale) }
  end
end
