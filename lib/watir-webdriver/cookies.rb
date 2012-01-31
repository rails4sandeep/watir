module Watir
  class Cookies
    def initialize(control)
      @control = control
    end

    def to_a
      @control.all_cookies.each do |e|
        e[:expires] = to_time(e[:expires]) if e[:expires]
      end
    end

    def add(name, value, opts = {})
      @control.add_cookie :name    => name,
                          :value   => value,
                          :secure  => opts[:secure],
                          :path    => opts[:path],
                          :expires => opts[:expires]
    end

    def delete(name)
      @control.delete_cookie(name)
    end

    def clear
      @control.delete_all_cookies
    end

    private

    def to_time(dt)
      if dt.respond_to?(:to_time)
        dt.to_time
      else
        Time.local t.year, t.month, t.day, t.hour, t.min, t.sec
      end
    end
  end
end
