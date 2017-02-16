  def split_by_double(input)
    input.map!{|x| x.split(/(\n\n)/)}.flatten!
  end

  def split_by_single(input)
    input.map! do |x|
      if x.include?("\n") && x != "\n\n"
        x.split(/(\n)/)
      else
        x
      end
    end
    input.flatten!
  end
  
  def heading6(input)
    if input.include?("###### ")
      input["###### "] = "<h6>"
      input.insert(-1, "</h6>")
    else
      input 
    end  
  end

  def heading5(input)
    if input.include?("##### ")
      input["##### "] = "<h5>"
      input.insert(-1, "</h5>")
    else
      input 
    end
  end

  def heading4(input)
    if input.include?("#### ")
      input["#### "] = "<h4>"
      input.insert(-1, "</h4>")
    else
      input 
    end
  end

  def heading3(input)
    if input.include?("### ")
      input["### "] = "<h3>"
      input.insert(-1, "</h3>")
    else
      input 
    end
  end

  def heading2(input)
    if input.include?("## ")
      input["## "] = "<h2>"
      input.insert(-1, "</h2>")
    else
      input 
    end
  end

  def heading1(input)
    if input.include?("# ")
      input["# "] = "<h1>"
      input.insert(-1, "</h1>")
    else
      input 
    end
  end

  def headings(input)
      input.map do |x|
      heading6(x); heading5(x); heading4(x); 
      heading3(x); heading2(x); heading1(x); 
      end
  end

  # def paragraphs(input)
  #     input.each_with_index.map do |x, idx|
  #       if x.include?("\n") == true || x.include?("<h") == true || x.include?("<li>")
  #         x
  #       elsif input[idx-1] == "\n\n" && input[idx+1] == "\n"
  #         x.insert(0, "<p>\n")
  #       elsif input[idx-1]=="\n" && input[idx-2].include?("<h") && (idx+1) > (input.length-1)
  #         x.insert(0, "<p>\n"); x.insert(-1, "\n</p>")
  #       elsif input[idx-1]== "\n" && (idx+1) > (input.length-1)
  #         x.insert(-1, "\n</p>")
  #       elsif input[idx-1] == "\n" && input[idx+1] == "\n\n"
  #         x.insert(-1, "\n</p>")
  #       elsif input[idx-1]=="\n" && input[idx+1]=="\n"
  #         x
  #       else
  #         x.insert(0, "<p>\n"); x.insert(-1, "\n</p>")
  #       end
  #     end      
  # end

  def paragraphs(input)
      input.each_with_index.map do |x, idx|
        if x.include?("\n") == true || x.include?("<h") == true || x.include?("<li>")
          x
        elsif input[idx-1] == "\n\n" && input[idx+1] == "\n\n"
          x.insert(0, "<p>"); x.insert(-1, "</p>")
        elsif input[idx-1] == "\n\n" && input[idx+1] == "\n"
          x.insert(0, "<p>")
        elsif input[idx-1] == "\n" && input[idx+1] == "\n\n"
          x.insert(-1, "</p>")
        elsif input[idx-1]=="\n" && input[idx-2].include?("<h")
          x.insert(0, "<p>"); x.insert(-1, "</p>")
        elsif input[idx-1]== "\n" && (idx+1) > (input.length-1)
          x.insert(-1, "\n</p>")
        elsif input[idx-1] == "\n" && input [idx+1]=="\n"
          x
        else
          x.insert(0, "<p>"); x.insert(-1, "</p>")
        end
      end
  end

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

  def strong_open(input)
      input.split.each{|x| x.sub!("*", "<strong>") if x[0] == "*"}
  end

  def strong_close(input)
      input.split.each {|x| x.sub!("*", "</strong>") if x[-2..-1].nil? != true && x[-2..-1].include?("*")}
  end

  def strong(input)
    input.map!{ |x| x.include?("*") ? strong_open(x): x}
    recombine(input)
    input.map!{ |x| x.include?("*") ? strong_close(x): x}
    recombine(input)
  end

  def recombine(input)
    input.map! {|x| x.kind_of?(Array) ? x.join(' ') : x}
  end

  def ordered_lists_items(input)
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

  def ordered_lists_tag_open(input)
    input.each_with_index do |x, idx|
        x.include?("<li>") && input[idx-1] == "\n\n" ? input.insert(idx, "<ol>\n") : x
      end
  end

    def ordered_lists_tag_close(input)
    input.each_with_index do |x, idx|
        if x.include?("<li>") && input[idx-2].include?("<li>") && (input[idx+2].nil? ||input[idx+2].include?("<li>") != true) 
          input.insert(idx+1,"\n</ol>" )
        else
          x
        end
      end
  end
  
  


