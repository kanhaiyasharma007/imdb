require 'spec_helper'

describe Movie do 
  before(:each) do
    @movie = FactoryGirl.create(:movie)
  end
  #let :movie { FactoryGirl :movie }
  it "validates presence for username" do
    expect(@movie.name).to be_true
  end
  it "validates for presence in alpa" do
    expect(@movie.name).to match(/[a-z0-9A-Z]/)
  end
  it "for uniqueness" do 
    k= Movie.create(:name=> 'hari', :description=> 'om')
    d=Movie.new(k.attributes)
    d.should_not be_valid
  end
end
