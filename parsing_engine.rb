require './lib/divide.rb'
require './lib/headers.rb'
require './lib/paragraphs.rb'
require './lib/emphasis.rb'
require './lib/strong.rb'
require './lib/unordered_list.rb'
require './lib/ordered_list.rb'

require 'pry'

unless ARGV.length == 2
  puts "Not the correct number of arguments"
  exit
end

input_file =  ARGV[0]
destination_file = ARGV[1]
lines_array = []
input_file = File.open(input_file, 'r')
lines_array << input_file.read

split_by_double(lines_array); split_by_single(lines_array); headings(lines_array);
emphasis(lines_array); 
unordered_list_item(lines_array)
unordered_list_tag_open(lines_array)
unordered_list_tag_close(lines_array)
ordered_list_tag_open(lines_array)
ordered_list_tag_close(lines_array)
ordered_list_item(lines_array)
strong(lines_array)
paragraphs(lines_array)

# binding.pry





output_file = File.open(destination_file, "w")
output_file.write(lines_array.join)
input_file.close
output_file.close

puts "converted #{ARGV[0]} (#{File.foreach(ARGV[0]).count} lines) 
to #{ARGV[1]} (#{File.foreach(ARGV[1]).count} lines) 
at #{Time.now}" 

