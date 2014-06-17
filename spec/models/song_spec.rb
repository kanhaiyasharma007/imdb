require 'spec_helper'

describe Song do
  before(:each) do
    @song = FactoryGirl.create(:song)
  end
  it "validates presence for username" do
    expect(@song.name).to be_true
  end

  it "validates presence for composer" do
    expect(@song.composer).to be_true
  end
end
