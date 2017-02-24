class Emphasize

  def emphasis_open(str_arr)
    str_arr.split.each do |str| 
    str.sub!("**", "<em>") if str[0..1] == "**"
    end
  end

  def emphasis_close(str_arr)
    str_arr.split.each do |str| 
    end_chars = str[-3..-1]
    str.sub!("**", "</em>") if end_chars.nil? != true && end_chars.include?("**")
    end
  end
  
  def emphasis(str_arr)
    str_arr.map! { |x| x.include?("**") ? emphasis_open(x) : x }
    Split.new.recombine(str_arr)
    str_arr.map! { |x| x.include?("**") ? emphasis_close(x) : x } 
    Split.new.recombine(str_arr)
  end

end