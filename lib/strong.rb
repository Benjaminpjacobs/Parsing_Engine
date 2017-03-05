class Str

  def strong_open(str_arr)
    str_arr.split.each do |str| 
      str.sub!("*", "<strong>") if str[0] == "*" 
    end
  end

  def strong_close(str_arr)
    str_arr.split.each do |str| 
      str.sub!("*", "</strong>") if str[-2..-1].nil? != true 
    end
  end

  def check_for_strong_open(str_arr)
    str_arr.map! do |str| 
      str.include?("*") ? strong_open(str): str
    end
  end
  
  def check_for_strong_close(str_arr)
    str_arr.map! do |str| 
      str.include?("*") ? strong_close(str): str 
    end
  end

  def strong(str_arr)
    check_for_strong_open(str_arr)
    Split.new.recombine(str_arr)
    check_for_strong_close(str_arr)
    Split.new.recombine(str_arr)
  end

end
