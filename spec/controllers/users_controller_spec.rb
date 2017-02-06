require "spec_helper"
require "rails_helper"

describe UsersController do

  it "create" do
    post :create, {user: {email: "3@3",
                          password_digest: "333",
                          age:"23",
                          description: "test"}}
    user = User.find_by rid: session[:user_id]
    expect(user).to_not eq(nil)
    expect(response).to redirect_to(root_url)
  end



end
