require 'spec_helper'

describe Wowwer::Character do
	it 'should fetch a character using name and realm' do
  	character = Wowwer::Character.fetch(name: "Kylarra", realm: "Hyjal")
  	character.should be_a(Wowwer::Character)
  end

  context 'with a character' do
    let(:character) { Wowwer::Character.fetch(name: "Kylarra", realm: "Hyjal") }
    subject { character }

    its(:name) { should == "Kylarra" }
    its(:realm) { should == "Hyjal" }
    its(:battlegroup) { should == "Whirlwind" }
    its(:last_modified) { should be_a(Time) }

    its(:level) { should be_a(Integer) }
    its(:level) { should == 85 }

    its(:thumbnail) { should == "hyjal/217/81894617-avatar.jpg" }
    its(:thumbnail_url) { should == "https://us.battle.net/static-render/us/hyjal/217/81894617-avatar.jpg" }

    its(:race) { should be_a(Wowwer::Race) }
    its(:'race.name') { should == "Draenei" }

    its(:character_class) { should be_a(Wowwer::CharacterClass) }
    its(:'character_class.name') { should == "Shaman" }
  end
end