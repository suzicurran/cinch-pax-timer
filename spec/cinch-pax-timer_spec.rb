require 'spec_helper'

describe Cinch::Plugins::PaxTimer do

  include Cinch::Test

  before(:each) do
    @bot = make_bot(Cinch::Plugins::PaxTimer, {})
  end

  before(:all) do
    # @plugin = Cinch::Plugins::PaxTimer.new
  end

  it 'should return the next pax' do
    msg = make_message(@bot, '!pax')
    get_replies(msg).first.
      should match(/PAX.+is \d+ days from now/)
  end


end

=begin


  # normal queries
  it 'should return a definition of a term' do
    @plugin.send(:get_def, 'computer').
      should include("A computer is a general purpose device")
  end

  it 'should not return multiple lined definitions' do
    @plugin.send(:get_def, 'Teenager').
      should_not include("\n")
  end

  it 'should not return definitions that are longer than 250 chars' do
    @plugin.send(:get_def, 'Teenager').length.
      should == 334
  end

  # Not found
  it 'should return an error message when a term is not found' do
    @plugin.send(:get_def, 'dasdafasfasfasfasafsdfsdfsadf').
      should include("I couldn't find anything for that search, sorry!")
  end

  it 'should provide suggestions if one is listed on the page' do
    @plugin.send(:get_def, 'smegama').
      should include("I couldn't find anything for that search, did you mean 'smegma'?")
  end

  # disambiguation
  it 'should return helful information when a disambuation page' do
    @plugin.send(:get_def, 'hipster').
      should include('is too vague and lead to a disambiguation page')
  end
end
=end
