require 'spec_helper'

shared_examples_for 'the brainless' do
  it { should be_dummy }
  it { should_not be_genius }
end