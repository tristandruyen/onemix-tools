#!/usr/bin/env ruby

PATH=File.expand_path(File.dirname(__FILE__))
def rotate_touchscreen(direction)
  p "#{__dir__}/rotate_touch.sh #{direction.to_s}"
end

def handle_orientation(orient_str)
  # p orient_str
  case orient_str
  when "right-up"
    rotate_touchscreen(:bottom)
  when "left-up"
    rotate_touchscreen(:top)
  when "normal"
    rotate_touchscreen(:left)
  when "bottom-up"
    rotate_touchscreen(:right)
  end
end

def locked?
  output = %x(sudo -u tristan /usr/bin/gsettings get org.gnome.settings-daemon.peripherals.touchscreen orientation-lock).chomp
  # p 'locked', output
  output == 'true'
end

# puts "start"
ARGF.each_line do |a|
  # puts a
  cap =  a.match(/\{'AccelerometerOrientation': <'(.*)'>\}.*/)
  p 'locked' && next if locked?
  system handle_orientation(cap.captures.first) if cap
end
