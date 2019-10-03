# frozen_string_literal: true

def assert_redirect_and_redirected_to(path)
  assert_response :redirect
  assert_redirected_to path
end
def assert_redirect_and_redirected_to_sign_in
  assert_redirect_and_redirected_to new_user_session_path(locale: nil)
end
