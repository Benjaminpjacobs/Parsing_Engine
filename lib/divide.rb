class Split
  
  def splits(input)
    input.map!{ |x| x.split(/(\n\n)/)}.flatten!
    .map!{ |x| x.include?("\n") && x != "\n\n" ? x.split(/(\n)/) : x }
    input.flatten!
  end

  def recombine(str_arr)
    str_arr.map! { |str| str.kind_of?(Array) ? str.join(' ') : str }
  end

end