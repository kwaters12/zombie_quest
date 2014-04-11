require 'spec_helper'

describe Plant do
  it_behaves_like 'the brainless' 
  let(:plant) { Plant.new }
  subject { plant }
end
