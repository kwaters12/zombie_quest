require 'spec_helper'
describe Zombie do
  let(:zombie) { Zombie.create }
  subject { zombie }
  before {zombie.eat_brains}

  it_behaves_like 'the brainless'
  

  context 'with a dummy zombie' do
    before {zombie.iq = 0}
    it { should be_dummy }
  end

  context 'with a smart zombie', focus: true do
    before {zombie.iq = 3}
    it { should_not be_dummy }
  end

  it 'is invalid without a name' do
    zombie = Zombie.new
    zombie.should_not be_valid
  end
  # Check that it matches a certain pattern using a regex
  it 'has a name that matches "Ash Clone"' do
    zombie = Zombie.new(name: "Ash Clone 1")
    zombie.name.should match(/Ash Clone \d/)
  end
  it 'includes tweets' do
    tweet1 = Tweet.new(status: 'UUUUUUnnnsdh')
    tweet2 = Tweet.new(status: 'sdfadsfsadfh')
    zombie = Zombie.new(name: 'Ash', tweets: [tweet1, tweet2])
    zombie.tweets.should include(tweet1)
    zombie.tweets.should include(tweet2)
  end
  it 'starts with two weapons' do
    zombie = Zombie.new(name: 'Ash')
    zombie.should have(2).weapons
  end
  it 'changes the number of Zombies' do
    zombie = Zombie.new(name: 'Ash')
    expect { zombie.save }.to change { Zombie.count }.by(1)
  end
  it 'raises an error if saved without a name' do
    zombie = Zombie.new
    expect { zombie.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'responds to name' do
    should respond_to(:name)
  end
  # Also works, and rspec will generate debug text that is readable
  # it { should respond_to(:name)}
  its(:name) { should == 'Ash' }
  its(:weapons) { should include(weapon) }
  its(:brain) { should be_nil }
  its('tweets.size') { should == 2 }

  context 'when hungry' do
    it 'craves brains'
    context 'with a veggie preference' do
      let(:zombie) { Zombie.new(vegetarian: true, weapons: [axe])}
      let(:axe) { Weapon.new(name: 'axe' )}
      subject { zombie }

      its(:weapons) { should include(axe) }
      its(:craving) { should == 'vegan brains'}
      it 'prefers vegan brains'

      it 'can use its axe' do
        zombie.swing(axe).should == true
      end
    end
  end

  it 'should not be hungry after eating brains' do
    expect { zombie.eat(:brains) }.to change {
      zombie.hungry
    }.from(true).to(false)
  end

  it 'is not a dummy zombie' do
    zombie.should_not be_dummy
  end

  it 'is a genius zombie' do
    zombie.should be_genius
  end

end