class Uols

  def unordered_list_item(str_arr)
    str_arr.each_with_index.map do |str, idx|
      if str.include?("\n") == true || str.include?("<h") == true
        str
      elsif str[0..1] == "* " 
        str.sub!("* ", "<li>")
        str.insert(-1, "</li>")
      else
        str
      end
    end
  end

  def unordered_list_tag_open(str_arr)
    str_arr.each_with_index do |str, idx|
      prev_line = str_arr[idx - 1]
      str.include?("<li>") && prev_line == "\n\n" ? 
      str_arr.insert(idx, "<ul>\n") : str
    end
  end
        
  def unordered_list_tag_close(str_arr)
    str_arr.each_with_index do |str, idx|
      sec_next_line = str_arr[idx + 2]
      sec_prev_line = str_arr[idx - 2]
      str.include?("<li>") && sec_prev_line.include?("<li>") && 
      (sec_next_line.nil? || sec_next_line.include?("<li>") != true) ? 
      str_arr.insert(idx+1,"\n</ul>" ) : str
    end
  end

  def all(str_arr)
    unordered_list_item(str_arr) 
    unordered_list_tag_open(str_arr) 
    unordered_list_tag_close(str_arr)
  end
    
end
