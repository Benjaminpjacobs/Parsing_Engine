require './lib/linemodule.rb'

class Ols
  include Lines

  def ordered_list_tag_open(str_arr)
    str_arr.each_with_index do |str, idx| 
      str[0].to_i > 0 && prev_line(str_arr, idx, 1) == "\n\n" ? 
      str_arr.insert( idx, "<ol>\n" ) : str
    end
  end
        
  def ordered_list_tag_close(str_arr)
    str_arr.each_with_index do |str, idx|
      str[0].to_i > 0 && prev_line(str_arr, idx, 2)[0].to_i > 0 && 
      (next_line(str_arr, idx, 2).nil? || next_line(str_arr, idx, 2) == 0 || 
      next_line(str_arr, idx, 1) == "\n\n" ) ? 
      str_arr.insert( idx + 1,"\n</ol>" ) : str  
    end
  end
  
  def ordered_list_item(str_arr)
    str_arr.map do |str|
      if str.include?("\n") == true || str.include?("<h") == true
        str
      elsif str[0].to_i > 0 && str[1] == "."  
        str[0..2] = "<li>"
        str.insert(-1, "</li>")
      elsif str[0].to_i > 0 && str[2] == "."  
        str[0..3] = "<li>"
        str.insert(-1, "</li>")
      elsif str[0].to_i > 0 && str[3] == "."  
        str[0..4] = "<li>"
        str.insert(-1, "</li>")     
      else
        str
      end
    end
  end

  def all(str_arr)
    ordered_list_tag_open(str_arr) 
    ordered_list_tag_close(str_arr) 
    ordered_list_item(str_arr)
  end

end