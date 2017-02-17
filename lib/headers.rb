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