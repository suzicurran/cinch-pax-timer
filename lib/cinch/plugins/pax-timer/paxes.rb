# -*- encoding: utf-8 -*-
module Cinch
  module Plugins
    # Versioning info
    class PaxTimer
      PAXES = [
        { type:      'aus',
          name:      'PAX Australia',
          date:      Time.parse('2016-11-04 08:00:00 +11:00'),
          estimated: false },
        { type:      'prime',
          name:      'PAX West',
          date:      Time.parse('2016-09-02 08:00:00 -08:00'),
          estimated: false },
        { type:      'west',
          name:      'PAX West',
          date:      Time.parse('2016-09-02 08:00:00 -08:00'),
          estimated: false },
        { type:      'south',
          name:      'PAX South',
          date:      Time.parse('2017-01-29 08:00:00 -06:00'),
          estimated: true },
        { type:      'east',
          name:      'PAX East',
          date:      Time.parse('2017-03-10 08:00:00 -05:00'),
          estimated: true }
      ]
    end
  end
end
