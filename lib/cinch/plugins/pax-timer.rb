# -*- encoding: utf-8 -*-
require 'cinch'
require 'time-lord'
require 'cinch/toolbox'
require 'cinch/cooldown'

module Cinch
  module Plugins
    # Cinch Cooldown for PAX countdowns
    class PaxTimer
      include Cinch::Plugin

      self.help = 'Use .pax for the next pax or .east, .west, .south or ' \
                  '.aus for the time to a specific pax.'

      match(/pax\z/, method: :next_pax)

      def next_pax(m)
        m.reply get_next_pax
      end

      PAXES.map { |p| p[:type] }.each do |pax|
        match(/(#{pax}|pax#{pax})\z/, method: "next_#{pax}")

        define_method "next_#{pax}" do |m|
          debug "#{pax}"
          m.reply get_next_pax(pax.to_s)
        end
      end

      private

      def get_next_pax(type = nil)
        @pax = get_next_pax_for(type)

        return 'I don\'t have info for the next one of those PAXes' if @pax.nil?

        message = ["#{@pax[:name]} is"]
        message << 'approximately' if @pax[:estimated]

        # Uncomment this once we can specify granularity in Time Lord.
        # message << TimeLord::Period.new(@pax[:date], Time.now).to_words
        message << Cinch::Toolbox.time_format(@pax[:date] - Time.now, [:days])
        message << 'from now'

        message << ' (No official date, yet)' if @pax[:estimated]
        message.join(' ')
      end

      def get_next_pax_for(type)
        paxes = PAXES.dup

        paxes.delete_if { |pax| pax[:date] - Time.now < 0 }
        paxes.delete_if { |pax| pax[:type] != type } unless type.nil?
        paxes.sort! { |a, b| b[:date] <=> a[:date] }

        paxes.last
      end
    end
  end
end
