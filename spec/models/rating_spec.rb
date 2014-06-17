require 'spec_helper'

describe Rating do
  before(:each) do
    @rating = FactoryGirl.create(:rating)
  end
  it "On rating" do
    expect((0..5)).to include(@rating.stars)
  end
  it "check for character" do
    m= Rating.create(stars: 'ab')
    expect(m.valid?).to eq(false)
  end
end
