require 'cinch'
require 'time-lord'
require 'cinch-toolbox'
require 'cinch-cooldown'

module Cinch::Plugins
  class PaxTimer
    include Cinch::Plugin

    PAXES = [ :east, :prime, :aus ]

    enforce_cooldown

    self.help = "Use .pax for the next pax or .east, .prime, or .aus for the time to a specific pax."

    match /pax\z/, method: :next_pax

    def next_pax(m)
      m.reply get_next_pax
    end

    PAXES.each do |pax|
      match /#{pax}|pax#{pax}/, :method => "next_#{pax}"

      define_method "next_#{pax}" do |m|
        debug "#{pax}"
        m.reply get_next_pax(pax.to_s)
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
    end
  end
end
