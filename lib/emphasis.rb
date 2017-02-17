  def emphasis_open(input)
      input.split.each{|x| x.sub!("**", "<em>") if x[0..1] == "**"}
  end

  def emphasis_close(input)
      input.split.each {|x| x.sub!("**", "</em>") if x[-3..-1].nil? != true && x[-3..-1].include?("**")}
  end
  
  def emphasis(input)
    input.map!{ |x| x.include?("**") ? emphasis_open(x): x}
    recombine(input)
    input.map!{ |x| x.include?("**") ? emphasis_close(x): x}
    recombine(input)
  end
  
  def recombine(input)
    input.map! {|x| x.kind_of?(Array) ? x.join(' ') : x}
  end
  
