  def unordered_list_item(input)
    input.each_with_index.map do |x, idx|
      if x.include?("\n") == true || x.include?("<h") == true
        x
      elsif x[0..1] == "* " 
        x.sub!("* ", "<li>")
        x.insert(-1, "</li>")
      else
        x
      end
    end
  end

  def unordered_list_tag_open(input)
    input.each_with_index do |x, idx|
        x.include?("<li>") && input[idx-1] == "\n\n" ? input.insert(idx, "<ul>\n") : x
    end
  end
        
  def unordered_list_tag_close(input)
    input.each_with_index do |x, idx|
    x.include?("<li>") && input[idx-2].include?("<li>") && (input[idx+2].nil? || input[idx+2].include?("<li>") != true) ? input.insert(idx+1,"\n</ul>" ) : x
    end
  end