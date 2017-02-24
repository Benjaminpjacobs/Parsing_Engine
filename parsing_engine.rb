require './lib/divide.rb'
require './lib/headers.rb'
require './lib/paragraphs.rb'
require './lib/emphasis.rb'
require './lib/strong.rb'
require './lib/unordered_list.rb'
require './lib/ordered_list.rb'
require './lib/read_write.rb'
require './lib/line_module.rb'

class Parser

  def input
    InOut.new.read(ARGV[0])
  end

  def splits
    Split.new.splits(input)
  end

  def heads
    Headers.new.headings(splits)
  end

  def emp
    Emphasize.new.emphasis(heads)
  end

  def bullets
    Uols.new.all(emp)
  end

  def numbers
    Ols.new.all(bullets)
  end

  def strength
    Str.new.strong(numbers)
  end

  def graph
    Para.new.paragraphs(strength)
  end

  def assemble
    InOut.new.write(graph, ARGV[1])
  end
  
end

unless ARGV.length == 2
  puts "Not the correct number of arguments"
  exit
end

Parser.new.assemble

puts "converted #{ARGV[0]} (#{File.foreach(ARGV[0]).count} lines) 
to #{ARGV[1]} (#{File.foreach(ARGV[1]).count} lines) 
at #{Time.now}" 