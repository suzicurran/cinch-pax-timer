require 'time-lord'
require 'cinch-cooldown'
require 'cinch-toolbox'

module Cinch::Plugins
  class PaxTimer
    include Cinch::Plugin

    enforce_cooldown

    self.help = "Use .pax for the next pax or .east, .prime, or .aus for the time to a specific pax."

    match /(time|pax|timetillpax)\z/, method: :next_pax
    match /east|paxeast/, method: :next_east
    match /prime|paxprime/, method: :next_prime
    match /aus|paxaus/, method: :next_aus

    def next_pax(m)
      m.reply get_next_pax
    end

    ['east', 'aus', 'prime'].each do |pax_type|
      define_method "next_#{pax_type}" do |m|
        m.reply get_next_pax(pax_type)
      end
    end

    def get_next_pax(type = nil)
      @filename = File.join(File.dirname(__FILE__), "../../../../config/pax.yml")
      if File::exist?(@filename)
        @paxes = YAML::load(File.open(@filename))

        @paxes.delete_if { |pax| pax[:date] - Time.now < 0 }
        @paxes.delete_if { |pax| pax[:type] != type } unless type.nil?
        @paxes.sort! { |a,b| b[:date] <=> a[:date] }

        @pax = @paxes.pop
        message = "#{@pax[:name]} is "
        message << 'approximately ' if @pax[:estimated]

        # Uncomment this once we can specify granularity in Time Lord.
        # message << TimeLord::Period.new(@pax[:date], Time.now).to_words
        message << "#{Cinch::Toolbox.time_format(@pax[:date] - Time.now, [:days])} from now"

        message << " (No official date, yet)" if @pax[:estimated]
        return message
      end
    end
  end
end
