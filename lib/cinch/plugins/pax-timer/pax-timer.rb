require 'cinch'
require 'time-lord'
require 'cinch/toolbox'
require 'cinch/cooldown'

module Cinch::Plugins
  class PaxTimer
    include Cinch::Plugin

    enforce_cooldown

    self.help = "Use .pax for the next pax or .east, .prime, or .aus for the time to a specific pax."

    match /pax\z/, method: :next_pax

    def next_pax(m)
      m.reply get_next_pax
    end

    PAXES = [
      { :type       => 'prime',
        :name       => 'PAX Prime',
        :date       => Time.parse('2013-08-30 08:00:00 -08:00'),
        :estimated  => false },
      { :type       => 'aus',
        :name       => 'PAX Australia',
        :date       => Time.parse('2014-07-18 08:00:00 -08:00'),
        :estimated  => true },
      { :type       => 'east',
        :name       => 'PAX East',
        :date       => Time.parse('2014-04-11 08:00:00 -08:00'),
        :estimated  => false }
    ]

    PAXES.map{ |p| p[:type] }.each do |pax|
      match /#{pax}|pax#{pax}/, :method => "next_#{pax}"

      define_method "next_#{pax}" do |m|
        debug "#{pax}"
        m.reply get_next_pax(pax.to_s)
      end
    end

    private

    def get_next_pax(type = nil)
      @pax = get_next_pax_for(type)

      if @pax.nil?
        return 'I don\'t have info for the next one of those PAXes'
      else
        message = "#{@pax[:name]} is "
        message << 'approximately ' if @pax[:estimated]

        # Uncomment this once we can specify granularity in Time Lord.
        # message << TimeLord::Period.new(@pax[:date], Time.now).to_words
        message << "#{Cinch::Toolbox.time_format(@pax[:date] - Time.now, [:days])} from now"

        message << " (No official date, yet)" if @pax[:estimated]
        return message
      end
    end

    def get_next_pax_for(type)
      paxes = PAXES.dup

      paxes.delete_if { |pax| pax[:date] - Time.now < 0 }
      paxes.delete_if { |pax| pax[:type] != type } unless type.nil?
      paxes.sort! { |a,b| b[:date] <=> a[:date] }

      return paxes.last
    end
  end
end
