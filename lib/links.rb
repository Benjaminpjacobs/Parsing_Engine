class Link

  def string_has_link(str)
    str.include?('[') && str.include?(']')
  end

  def string_has_opt_title(str)
    str.include?('[') && str.include?(']') && (str.include?('"') || str.include?("'"))
  end

  def split_string(str)
    str.split(/[),\[,\]]/)
  end

  def swap(array, idx)
    array[idx-1], array[idx] = array[idx], array[idx-1]
  end

  def re_order(array)
    array.each_with_index do |str, idx|
      if str.include?("http")
        swap(array, idx)
        break
      else
        str
      end
    end
    return array
  end

  def change_elements_with_title(array)
    array.each_with_index do |str, idx|
      if str.include?('http') 
        str.sub!(' "', '\' title="')
        str.insert(-1, ">")
        str.sub!("(", "<a href='") 
        array[idx+1].insert(-1, '</a>')
      else
        str
      end
    end
    array.join
  end

  def change_elements_no_title(array)
     array.each_with_index do |str,idx|
      if str.include?('http')
        str.sub!("(", "<a href='")
        str.insert(-1, "'>")
        array[idx+1].insert(-1, '</a>')
      else
        str
      end
    end
    array.join
  end
  
  def link_it_up(str)
      if string_has_opt_title(str)
        array = split_string(str)
        re_order(array)
        change_elements_with_title(array)
      elsif string_has_link(str)
        array = split_string(str)
        re_order(array)
        change_elements_no_title(array)
      else
        str
      end
  end

  def search_for_links(str_arr)
    str_arr.map{|str| link_it_up(str)}
  end
end



