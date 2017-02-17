class Split
  
  def splits(input)
    input.map!{|x| x.split(/(\n\n)/)}.flatten!
    .map!{ |x| x.include?("\n") && x != "\n\n" ? x.split(/(\n)/) : x}
    input.flatten!
  end

  def recombine(input)
    input.map! {|x| x.kind_of?(Array) ? x.join(' ') : x}
  end

end



