require 'spec_helper'

describe User do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end
  it "validates presence for username" do
    expect(@user.name).to be_true
  end
end
