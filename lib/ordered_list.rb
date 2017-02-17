class Ols

  def ordered_list_tag_open(input)
    input.each_with_index{|x, idx| x[0].to_i > 0 && input[idx-1] == "\n\n" ? input.insert(idx, "<ol>\n") : x}
  end
        
  def ordered_list_tag_close(input)
    input.each_with_index do |x, idx|
      x[0].to_i > 0 && input[idx-2][0].to_i > 0 && (input[idx+2].nil? ||input[idx+2][0] == 0 || input[idx+1] == "\n\n") ? input.insert(idx+1,"\n</ol>" ) : x
    end
  end
  
  def ordered_list_item(input)
    input.map do |x|
      if x.include?("\n") == true || x.include?("<h") == true
        x
      elsif x[0].to_i > 0 && x[1] == "."  
        x[0..2] = "<li>"
        x.insert(-1, "</li>")
      elsif x[0].to_i > 0 && x[2] == "."  
        x[0..3] = "<li>"
        x.insert(-1, "</li>")
      elsif x[0].to_i > 0 && x[3] == "."  
        x[0..4] = "<li>"
        x.insert(-1, "</li>")     
      else
        x
      end
    end
  end

  def all(input)
      ordered_list_tag_open(input); ordered_list_tag_close(input); ordered_list_item(input)
  end

end

