module FeatureHelpers
  def sign_in_with_backdoor
    user = create(:user)
    visit root_path(as: user)

    user
  end
end
