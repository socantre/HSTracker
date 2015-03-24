class Configuration

  class << self
    # get the HS locale
    def locale
      locale = NSUserDefaults.standardUserDefaults.objectForKey 'hearthstone_locale'
      return locale unless locale.nil?

      current = NSLocale.currentLocale.localeIdentifier
      case current
        when /^fr/
          'frFR'
        when /^ru/
          'ruRU'
        when /^de/
          'deDE'
        when /^es/
          'esES'
        when /^it/
          'itIT'
        when /^ko/
          'koKR'
        when /^pl/
          'plPL'
        when /^pt/
          'ptPT'
        when /^zh/
          'zhCN'
        else
          'enUS'
      end
    end

    # set the HS locale
    def locale=(value)
      NSUserDefaults.standardUserDefaults.setObject(value, forKey: 'hearthstone_locale')
    end

    def on_card_played
      played = NSUserDefaults.standardUserDefaults.objectForKey 'card_played'
      if played
        return played.to_sym
      end
      :fade
    end

    def on_card_played=(value)
      NSUserDefaults.standardUserDefaults.setObject(value, forKey: 'card_played')
    end

    def lock_windows
      NSUserDefaults.standardUserDefaults.objectForKey('windows_locked')
    end

    def lock_windows=(value)
      NSUserDefaults.standardUserDefaults.setObject(value, forKey: 'windows_locked')
      NSNotificationCenter.defaultCenter.post('lock_windows')
    end

    def window_transparency
      NSUserDefaults.standardUserDefaults.objectForKey('window_transparency') || 0.1
    end

    def window_transparency=(value)
      NSUserDefaults.standardUserDefaults.setObject(value, forKey: 'window_transparency')
      NSNotificationCenter.defaultCenter.post('window_transparency')
    end

  end

end