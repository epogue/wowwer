require 'spec_helper'

describe Wowwer::CharacterClass do
  it 'grabs all the classes' do
  	collection = Wowwer::CharacterClass.all
    collection.should be_a(Array)
    collection[0].should be_a(Wowwer::CharacterClass)
  end

  it 'finds a class by id' do
    Wowwer::CharacterClass.find(1).should be_a(Wowwer::CharacterClass)
  end

  it 'finds a class by name' do
    Wowwer::CharacterClass.find_by_name("warrior").should be_a(Wowwer::CharacterClass) 
  end

  context 'a class' do
    let(:klass) { Wowwer::CharacterClass.find(1) }
    subject { klass }

    its(:name) { should == "Warrior" }
    its(:power_type) { should == "rage" }
  end
end