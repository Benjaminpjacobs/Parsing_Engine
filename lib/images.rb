class Image

  def line_is_image_tag(str)
    str.include?('![')
  end

  def has_opt_title(str)
    str.include?('"') || str.include?("'")
  end
  
  def split_reverse(str)
    str.split('(').map!{|x| x}.reverse.join
  end
  
  def add_alt_tag(str)
    str.sub!('![',  ' alt="')
    str.sub!(']', '">')
  end

  def add_src_tag(str)
    str.insert(0, '<img src="')
    str.sub!(')', '"')
  end

  def add_title_tag(str)
    str.include?('"') ? str.sub!('"', '" title="') : str.sub!("'", "title='") 
    str.sub!(')', ' ') 
  end

  def total_tag_wtih_title(str)
    str = split_reverse(str)
    add_alt_tag(str)
    add_title_tag(str)
    add_src_tag(str)
    str
  end

  def total_tag(str)
    str = split_reverse(str)
    add_alt_tag(str)
    add_src_tag(str)
    str
  end
  
  def convert_image_tag(str)
    if line_is_image_tag(str) == true && has_opt_title(str) == true
      total_tag_wtih_title(str)
    elsif line_is_image_tag(str) == true 
      total_tag(str)
    else
      str
    end
  end

  def search_for_image(str_arr)
    str_arr.map!{ |str| convert_image_tag(str) }
  end

end