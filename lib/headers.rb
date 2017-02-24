class Headers
 
  def heading6(str)
    if str.include?("###### ")
       str["###### "] = "<h6>"
       str.insert(-1, "</h6>")
    else
       str 
    end  
  end

  def heading5(str)
    if str.include?("##### ")
       str["##### "] = "<h5>"
       str.insert(-1, "</h5>")
    else
       str 
    end
  end

  def heading4(str)
    if str.include?("#### ")
       str["#### "] = "<h4>"
       str.insert(-1, "</h4>")
    else
       str 
    end
  end

  def heading3(str)
    if str.include?("### ")
       str["### "] = "<h3>"
       str.insert(-1, "</h3>")
    else
       str 
    end
  end

  def heading2(str)
    if str.include?("## ")
       str["## "] = "<h2>"
       str.insert(-1, "</h2>")
    else
       str 
    end
  end

  def heading1(str)
    if str.include?("# ")
       str["# "] = "<h1>"
       str.insert(-1, "</h1>")
    else
       str 
    end
  end

  def headings(str_arr)
    str_arr.map do |str|
      heading6(str) 
      heading5(str)
      heading4(str) 
      heading3(str) 
      heading2(str) 
      heading1(str)
      end
  end
  
end 