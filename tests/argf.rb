#!/usr/bin/env ruby

# https://robm.me.uk/ruby/2013/12/03/argf-ruby.html

# foo = Array.new

# ARGF.each_line do |line|
# 	# puts line
# 	foo.push(line)
# end
# put s foo[0]



@csv_lines = Array.new
ARGF.each_line do |line|

    puts "line is a #{line.class}"
    line_gsubed = line.gsub /"/, ''
    puts "line_gsubed = #{line_gsubed}"
    line_gsubed = line_gsubed.chomp
    #Split at commas and turn into arrays
    line_split = line_gsubed.split(',') 
    puts "line_split = #{line_split}"
    puts line_split.class



    puts '======='
    # puts "recieved a line #{line}"
    # puts "chomped is #{line.chomp}"

    new_s = line.gsub /"/, ''
    puts "new_s is #{new_s}"
    # puts "gsub is #{new_s}"
    split_s = new_s.split(',')
    puts split_s

    # puts "gsub.split is #{split_s}"
    # puts "gsub.split.last is #{split_s.last}"
    # puts "split.last is of type #{split_s.class}"
    split_s.last[0] = split_s.last[0].chomp #Why is this a 2dimentional array?

    # puts "gsub.split.chomped is #{split_s}"
    # puts "split is #{line.split}"
    @csv_lines.push(line)

    # puts "new_s.split is #{new_s.split(',')}"
    # puts "derp chomped is #{new_s.split(',').last.chomp}"
    # puts new_s.class
    anArray = new_s.split(',')
    anArray.collect{|x| x.chomp}
    puts "aFixedArray is #{anArray}"
end
# @columns = @csv_lines.shift

# puts "first column is #{@colummns}"
# puts "csv_lines[0] is #{@csv_lines[0]}"
