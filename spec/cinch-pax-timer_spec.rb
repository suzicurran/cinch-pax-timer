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
      msg = get_replies(msg).first
      expect(msg.text).to match(/PAX.+is (approximatly )?\d+ days from now/)
    end

    it 'should return nothing if there are arguments' do
      msg = make_message(@bot, '!pax fail')
      expect(get_replies(msg).first).to be_nil
    end
  end

  it 'should respond to .prime correctly' do
    msg = make_message(@bot, '!prime')
    msg = get_replies(msg).first
    expect(msg.text).to match(/PAX Prime is.+days from now/)
  end

  it 'should respond to .paxprime correctly' do
    msg = make_message(@bot, '!paxprime')
    msg = get_replies(msg).first
    expect(msg.text).to match(/PAX Prime is.+days from now/)
  end

  it 'should respond to .east correctly' do
    msg = make_message(@bot, '!east')
    msg = get_replies(msg).first
    expect(msg.text).to match(/PAX East is.+days from now/)
  end

  it 'should respond to .paxeast correctly' do
    msg = make_message(@bot, '!paxeast')
    msg = get_replies(msg).first
    expect(msg.text).to match(/PAX East is.+days from now/)
  end

  it 'should respond to .aus correctly' do
    msg = make_message(@bot, '!aus')
    msg = get_replies(msg).first
    expect(msg.text).to match(/PAX Australia is.+days from now/)
  end

  it 'should respond to .paxaus correctly' do
    msg = make_message(@bot, '!paxaus')
    msg = get_replies(msg).first
    expect(msg.text).to match(/PAX Australia is.+days from now/)
  end
end
