require 'spec_helper'

describe Cinch::Plugins::PaxTimer do

  include Cinch::Test

  before(:each) do
    @bot = make_bot(Cinch::Plugins::PaxTimer, {})
  end

  before(:all) do
    # @plugin = Cinch::Plugins::PaxTimer.new
  end

  describe :pax do
    it 'should return the next pax' do
      msg = make_message(@bot, '!pax')
      get_replies(msg).first.
        should match(/PAX.+is \d+ days from now/)
    end

    it 'should return nothing if there are arguments' do
      msg = make_message(@bot, '!pax fail')
      get_replies(msg).first.
        should be_nil
    end
  end

  it 'should respond to .prime correctly' do
    msg = make_message(@bot, '!prime')
    get_replies(msg).first.
      should match(/PAX Prime is \d+ days from now/)
  end

  it 'should respond to .paxprime correctly' do
    msg = make_message(@bot, '!paxprime')
    get_replies(msg).first.
      should match(/PAX Prime is \d+ days from now/)
  end

  it 'should respond to .east correctly' do
    msg = make_message(@bot, '!east')
    get_replies(msg).first.
      should match(/PAX East is \d+ days from now/)
  end

  it 'should respond to .paxeast correctly' do
    msg = make_message(@bot, '!paxeast')
    get_replies(msg).first.
      should match(/PAX East is \d+ days from now/)
  end

  it 'should respond to .aus correctly' do
    msg = make_message(@bot, '!aus')
    get_replies(msg).first.
      should match(/PAX Australia is \d+ days from now/)
  end

  it 'should respond to .paxaus correctly' do
    msg = make_message(@bot, '!paxaus')
    get_replies(msg).first.
      should match(/PAX Australia is \d+ days from now/)
  end
end
