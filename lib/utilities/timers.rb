module Timers
  def self.set_interval(delay)
    Thread.new do
      loop do
        sleep delay
        yield # call passed block
      end
    end
  end
end
