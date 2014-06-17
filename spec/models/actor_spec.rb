require 'spec_helper'

describe Actor do
before(:each) do
    @actor = FactoryGirl.create(:actor)
  end
  it "validates presence for username" do
    expect(@actor.name).to be_true
  end
end
