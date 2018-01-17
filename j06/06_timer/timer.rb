class Timer
  #write your code here
  attr_accessor :seconds

  def initialize
  	@seconds = 0
  end

  def time_string
  	secs = (@seconds % 60)
  	mins = ((@seconds % 3600) / 60)
  	hours = (@seconds / 3600)

  	return("%02d" % [hours]) + ":" + ("%02d" % [mins]) + ":" +("%02d" % [secs])
  end
end

# time = Timer.new
# time.seconds = 72
# puts time.time_string