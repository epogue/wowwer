require 'spec_helper'

describe Wowwer::Race do
  it 'grabs all the races' do
  	collection = Wowwer::Race.all
    collection.should be_a(Array)
    collection[0].should be_a(Wowwer::Race)
  end

  it 'finds a race by id' do
    Wowwer::Race.find(1).should be_a(Wowwer::Race)
  end

  it 'finds a race by name' do
    Wowwer::Race.find_by_name("human").should be_a(Wowwer::Race) 
  end

  context 'a race' do
    let(:race) { Wowwer::Race.find(1) }
    subject { race }

    its(:name) { should == "Human" }
    its(:side) { should == "alliance" }
  end
end