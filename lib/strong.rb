class Str

  def strong_open(input)
    input.split.each{|x| x.sub!("*", "<strong>") if x[0] == "*"}
  end

  def strong_close(input)
    input.split.each {|x| x.sub!("*", "</strong>") if x[-2..-1].nil? != true}
    #  && x[-2.-1].include?("*")}
  end

  def strong(input)
    input.map!{ |x| x.include?("*") ? strong_open(x): x}
    Split.new.recombine(input)
    input.map!{ |x| x.include?("*") ? strong_close(x): x}
    Split.new.recombine(input)
  end

end
